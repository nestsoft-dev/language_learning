// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/constant.dart';

class MyAppBar extends StatelessWidget {
  void Function()? onPressed;
  final String text;
  final Widget? lastChild;
  final Widget? middleChild;
  MyAppBar({
    Key? key,
    this.onPressed,
    required this.text,
    this.lastChild,
    this.middleChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: MediaQuery.of(context).size.width,
      color: appBarColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.white,
                  ),
                ),
                middleChild ??
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.fredoka(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: lastChild ?? const SizedBox(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
