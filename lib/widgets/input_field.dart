import 'package:delivery/utils/colors.dart';
import 'package:flutter/material.dart';

Widget roundedInputField(Widget child) => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27.0),
          border: Border.all(color: primaryColor())),
      child: child,
    );
