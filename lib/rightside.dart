import 'package:flutter/material.dart';
//import './constants.dart';

class RightBar extends StatelessWidget {
  final double barWidth;
  const RightBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 30,
          width: barWidth,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.amber,
                width: 4,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Colors.black),
        )
      ],
    );
  }
}
