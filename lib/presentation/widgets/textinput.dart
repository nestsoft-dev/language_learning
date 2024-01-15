// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/constant.dart';

class MyTextInput extends StatelessWidget {
  final String titleText;
  final String placeHolderText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType type;
  const MyTextInput({
    Key? key,
    required this.titleText,
    required this.placeHolderText,
    required this.controller,
    required this.obscureText,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: GoogleFonts.fredoka(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFE5E5E5)),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: textInputColor),
              child: TextField(
                controller: controller,
                obscureText: obscureText,
                keyboardType: type,
                style: GoogleFonts.fredoka(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                    hintText: placeHolderText,
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.fredoka(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w400)),
              ))
        ],
      ),
    );
  }
}
