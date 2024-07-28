import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hinttext;
  final bool? issecured;
  final bool? isrequired;
  final IconData? icon;
  final onchanged;
  const CustomTextfield(
      {super.key,
      required this.hinttext,
      this.issecured,
      this.icon,
      this.onchanged,
      this.isrequired});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: TextFormField(
        onChanged: onchanged,
        obscureText: issecured ?? false,
        decoration: InputDecoration(
          filled: true,
          hintText: hinttext,
          prefixIcon: Icon(icon ?? Icons.email_outlined),

          //enable-->
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: BorderSide.none),

          //focus-->
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.teal), // Set border color when the field is focused
            borderRadius: BorderRadius.circular(14.0),
          ),

          //focus-->
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.red), // Set border color when the field is focused
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
      ),
    );
  }
}
