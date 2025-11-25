import 'package:flutter/material.dart';

Widget customLabelWidget(IconData icon, String lableText) => Row(
  children: [
    Icon(icon, color: Colors.deepPurple),
    SizedBox(width: 5),
    Text(lableText, style: TextStyle(fontWeight: FontWeight.bold)),
  ],
);
