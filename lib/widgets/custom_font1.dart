import 'package:flutter/material.dart';

class CustomFont1 extends StatelessWidget {
  final String? text;
  final color;
  final fontsize;
  final fontweight;
  const CustomFont1(
      {super.key, this.text, this.color, this.fontsize, this.fontweight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color ?? Colors.white,
          fontWeight: fontweight ?? FontWeight.bold,
          fontSize: fontsize ?? 22,
          fontFamily: "robotomono"),
    );
  }
}
