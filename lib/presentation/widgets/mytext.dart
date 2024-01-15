// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final Color color;
  final double fontSize;
  final TextAlign alignment;
  const MyText({
    Key? key,
    required this.text,
    required this.weight,
    required this.color,
    required this.fontSize,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: GoogleFonts.fredoka(
          fontSize: fontSize, fontWeight: weight, color: color),
    );
  }
}
