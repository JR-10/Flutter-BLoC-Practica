import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_bloc_practica/Widgets/gradient_back.dart';

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
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(altura: 300.0),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                // wraper para agrupar el area clicleable
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: null,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
