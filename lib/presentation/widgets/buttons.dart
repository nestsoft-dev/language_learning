// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/constant.dart';

class Button extends StatelessWidget {
  void Function() onTap;
  final String text;
  Button({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: onBoardingButton,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.fredoka(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            )),
      ),
    );
  }
}
