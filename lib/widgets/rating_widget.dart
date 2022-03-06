import 'package:flutter/material.dart';
import 'package:cozycation/helpers/theme.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    Key? key,
    required this.rate,
  }) : super(key: key);

  final int rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...icon(rate),
      ],
    );
  }

  List<Widget> icon(rate) {
    List<Widget> icons = [];
    for (var i = 0; i < 5; i++) {
      if (i < rate) {
        icons.add(Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Icon(
            Icons.star,
            size: 20,
            color: orange,
          ),
        ));
      } else {
        icons.add(Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Icon(
            Icons.star,
            size: 20,
            color: darkGrey,
          ),
        ));
      }
    }
    return icons;
  }
}
