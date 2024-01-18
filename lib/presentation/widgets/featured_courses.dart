import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class FeaturedCoursesCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  const FeaturedCoursesCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        height: size.height * 0.18,
        width: size.width * 0.75,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: textInputColor, borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        text: title,
                        weight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 19,
                        alignment: TextAlign.start),
                    MyText(
                        text: subtitle,
                        weight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 14,
                        alignment: TextAlign.start)
                  ],
                ),
                Image.asset(
                  imagePath,
                  height: size.height * 0.1,
                  width: size.width * 0.15,
                  fit: BoxFit.contain,
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const Row(
              children: [
                Icon(
                  Icons.timer,
                  color: timerColor,
                  size: 15,
                ),
                MyText(
                    text: ' 2 hours',
                    weight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 14,
                    alignment: TextAlign.start)
              ],
            )
          ],
        ),
      ),
    );
  }
}
