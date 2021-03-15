import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review("assets/img/messi.jpg", "Leonel Messi", "1 review · 5 photos",
            "There is an amazing place in Sri Lanka"),
        Review("assets/img/iniesta.jpg", "Andres Iniesta",
            "2 review · 5 photos", "There is an amazing place in Sri Lanka"),
        Review("assets/img/xavi.jpg", "Xavi Hernadez", "2 review · 2 photos",
            "There is an amazing place in Sri Lanka"),
      ],
    );
  }
}
