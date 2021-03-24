import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData iconoData;
  final VoidCallback onPresseded;

  FloatingActionButtonGreen(
      {Key key, @required this.iconoData, @required this.onPresseded})
      : super(key: key);

  @override
  _FloatingActionButtonGreenState createState() =>
      _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  /*
  void onPressedFav() {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Agregaste a tus Favoritos"),
    ));
  }
  */

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      // onPressed: onPressedFav,
      onPressed: widget.onPresseded,
      child: Icon(Icons.favorite_border),
      heroTag: null,
    );
  }
}
