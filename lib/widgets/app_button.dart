import 'package:flutter/material.dart';
import '../utils/app_color.dart';

class AppButton extends StatelessWidget {
  final text;
  final ontap;
  const AppButton({super.key, this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    return    Container(
      margin:
      const EdgeInsets.only(top: 30, bottom: 5.0),
      alignment: Alignment.center,
      child: InkWell(
        onTap: ontap,
        child: Container(
            width: 150,
            alignment: Alignment.center,
            padding:  EdgeInsets.symmetric(
                vertical: 12.0),
            decoration: BoxDecoration(
              color: AppColor.cerulean,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              text??' ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
