import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  String title = "Popular";
  double altura = 0.0;

  GradientBack({Key key, this.altura});

  @override
  Widget build(BuildContext context) {
    // Declarar variables especiales
    double alturaPantalla = MediaQuery.of(context).size.height;
    double anchoPantalla = MediaQuery.of(context).size.width;

    // validacion altura == null, entonces toma fullscreen
    if (altura == null) {
      altura = alturaPantalla;
    }

    return Container(
        width: anchoPantalla,
        height: altura,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: FittedBox(
          fit: BoxFit.none,
          alignment: Alignment(-1.5, -0.8),
          child: Container(
            width: alturaPantalla,
            height: alturaPantalla,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              borderRadius: BorderRadius.circular(alturaPantalla / 2),
            ),
          ),
        )
        /*
      Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold),
      ),*/
        // alignment: Alignment(-0.9, -0.6),
        );
  }
}
