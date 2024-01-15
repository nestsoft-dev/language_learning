// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class IntroListCard extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color? color;
  const IntroListCard({
    Key? key,
    required this.text,
    required this.imagePath,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5).copyWith(bottom: 10),
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color ?? textInputColor,
            borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          CircleAvatar(
            backgroundColor: textInputColor.withOpacity(0.7),
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(
            width: 10,
          ),
          MyText(
              text: text,
              weight: FontWeight.w600,
              color: Colors.white,
              fontSize: 17, alignment: TextAlign.center,)
        ]),
      ),
    );
  }
}
