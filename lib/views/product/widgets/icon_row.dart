import 'package:delivery/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget iconRow(String str, IconData icon, Color color) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          str,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
