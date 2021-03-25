import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_bloc_practica/Place/model/place.dart';
import 'package:platzi_bloc_practica/Place/ui/widgets/card_image.dart';
import 'package:platzi_bloc_practica/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_bloc_practica/User/bloc/bloc_user.dart';
import 'package:platzi_bloc_practica/Widgets/button_purple.dart';
import 'package:platzi_bloc_practica/Widgets/gradient_back.dart';
import 'package:platzi_bloc_practica/Widgets/text_input.dart';
import 'package:platzi_bloc_practica/Widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  // Declaracion de variable para recibir objeto de tipo File
  File image;

  AddPlaceScreen({Key key, this.image}) : super(key: key);

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;

    // Declaracion del UserBloc
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(altura: 300.0),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50.0, left: 5.0),
                // wraper para agrupar el area clicleable
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left, color: Colors.white),
                    // Regresar a la pantalla anterior
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                  child: Container(
                      width: anchoPantalla,
                      child: Container(
                        padding:
                            EdgeInsets.only(top: 50.0, left: 20.0, right: 10.0),
                        child: TitleHeader(title: "Add a new Place"),
                      )))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  // -------- Foto ---------
                  child: CardImage(
                    pathImage: widget.image.path,
                    iconoData: Icons.camera_alt,
                    ancho: 350.0,
                    alto: 250.0,
                    leftDerecho: 0,
                    //onPressedFabIcon: null,
                  )),
              Container(
                  // ----------- Textfield titulo ---------------
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    maxLines: 50,
                    controller: _controllerTitlePlace,
                  )),
              TextInput(
                hintText: "Descrption",
                inputType: TextInputType.multiline,
                maxLines: 50,
                controller: _controllerDescriptionPlace,
              ),
              Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                      hintText: "Add Location", iconData: Icons.location_on)),
              Container(
                width: 70.0,
                //  margin: EdgeInsets.only(top: 20.0),
                child: ButtonPurple(
                  buttonText: "Add Place",
                  onPressed: () {
                    // paso 1: Firebase Storage
                    // Obtener el id del usuario
                    // paso 2: Guardar Cloud Firestore
                    userBloc
                        .updatePlaceData(Place(
                      name: _controllerTitlePlace
                          .text, // obtener el titulo del texto del imput
                      description: _controllerDescriptionPlace
                          .text, // obtener la decripcion
                      likes: 0,
                    ))
                        .whenComplete(() {
                      print("TERMINO");
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
