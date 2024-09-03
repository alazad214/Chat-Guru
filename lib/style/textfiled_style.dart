import 'package:flutter/material.dart';

InputDecoration appInputDecoretion(label, icon) {
  return InputDecoration(
    label: Text(label ?? " "),
    suffixIcon: Icon(icon ?? Icons.email_outlined),
    filled: true,

    //enable-->
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: Colors.blue, width: 1),
    ),
    //focus-->
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(14.0),
    ),
    //focus-->
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(14.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(14.0),
    ),
  );
}
