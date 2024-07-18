import 'package:flutter/material.dart';

void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 6,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(30),
    content: Text(text),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ));
}
