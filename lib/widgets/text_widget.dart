import 'package:flutter/material.dart';

Widget textWidget(
    {required String text,
      double? fontSize,
      int? textLine,
      Color? color,
      FontWeight? fontWeight,
      TextAlign? textAlign,

    }) {
  return Text(
    text,
    maxLines: textLine ?? 1,
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(
        fontSize: fontSize ?? 16,
        color: color ?? Colors.white,
        fontWeight:  fontWeight ?? FontWeight.normal,
    ),
  );
}