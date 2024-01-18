import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class GrammerBox extends StatelessWidget {
  const GrammerBox({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: textInputColor),
        child: MyText(
            text: 'I will follow you wherever you .............',
            weight: FontWeight.w300,
            color: Colors.white,
            fontSize: 16,
            alignment: TextAlign.start),
      ),
    );
  }
}
