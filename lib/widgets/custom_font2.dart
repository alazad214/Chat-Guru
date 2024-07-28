import 'package:flutter/material.dart';

class CustomFont2 extends StatelessWidget {
  final String? text;
  final color;
  final fontsize;
  final fontweight;
  const CustomFont2(
      {super.key, this.text, this.color, this.fontsize, this.fontweight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        text!,
        style: TextStyle(
            color: color ?? Colors.black,
            fontWeight: fontweight ?? FontWeight.w500,
            fontSize: fontsize ?? 17,
            ),
      ),
    );
  }
}
