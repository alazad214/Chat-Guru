import 'package:flutter/material.dart';

InputDecoration appInputDecoretion(label, icon) {
  return InputDecoration(
    filled: true,
    prefixIcon: Icon(icon ?? Icons.email_outlined),
    label: Text(label ?? " "),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.0), borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.teal),
      borderRadius: BorderRadius.circular(14.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(14.0),
    ),
  );
}
