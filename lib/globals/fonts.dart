import 'package:flutter/material.dart';

poppins({Color? color, double? fontSize, FontWeight? fontWeight}) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: fontWeight ?? FontWeight.normal,
    fontSize: fontSize ?? 20,
    color: color ?? Colors.white);
