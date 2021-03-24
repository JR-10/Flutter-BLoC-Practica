import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  // para el evento de presionar el boton
  final VoidCallback onPressed;
  bool mini;
  var icon;
  double iconSize;
  var color;

// onpressed se hace obligatorio
  CircleButton(this.mini, this.icon, this.iconSize, this.color,
      @required this.onPressed);

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }
}

class _CircleButton extends State<CircleButton> {
  void onPressedButton() {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
      backgroundColor: widget.color,
      mini: widget.mini,
      onPressed: widget.onPressed,
      child: Icon(
        widget.icon,
        size: widget.iconSize,
        color: Color(0xFF4268D3),
      ),
      heroTag: null,
    ));
  }
}
