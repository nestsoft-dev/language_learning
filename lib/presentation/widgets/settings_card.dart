// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class SettingsCard extends StatelessWidget {
  void Function()? onTap;
  final String name;
  final String imagePath;
  SettingsCard({
    Key? key,
    this.onTap,
    required this.name,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(20),
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: textInputColor),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            MyText(
                text: name,
                weight: FontWeight.w500,
                color: Colors.white,
                fontSize: 18,
                alignment: TextAlign.start)
          ],
        ),
      ),
    );
  }
}
