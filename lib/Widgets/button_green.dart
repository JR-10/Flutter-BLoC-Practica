import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  final String text;
  double ancho = 0.0;
  double alto = 0.0;
  final VoidCallback onPressed;

  ButtonGreen(
      {Key key,
      @required this.text,
      @required this.ancho,
      @required this.alto,
      @required this.onPressed})
      : super(key: key);

  @override
  _ButtonGreenState createState() => _ButtonGreenState();
}

class _ButtonGreenState extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    // =============== Retorno del Boton ============
    return InkWell(
      // ===== se utiliza (widget.) para llamar parametros desde otra clase ===========
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        width: widget.ancho,
        height: widget.alto,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: [Color(0xFFa7ff84), Color(0xFF1cbb78)],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
          ),
        ),
      ),
    );
  }
}
