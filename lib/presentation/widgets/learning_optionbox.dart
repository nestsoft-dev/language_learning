// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class LearningOptionBox extends StatelessWidget {
  final Color? color;
  final String imagePath;
  final String text;
  
  const LearningOptionBox({
    Key? key,
    this.color,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: size.height * 0.20,
        width: size.width * 0.10,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: textInputColor),
          color: color ?? Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imagePath,
              height: 75,
              width: 55,
            ),
            MyText(
                text: text,
                weight: FontWeight.w500,
                color: Colors.white,
                fontSize: 20,
                alignment: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
