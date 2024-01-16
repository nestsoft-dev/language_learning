import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class FeaturedCoursesCard extends StatelessWidget {
  const FeaturedCoursesCard({super.key});

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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        text: 'Grammar\nQuiz',
                        weight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 19,
                        alignment: TextAlign.start),
                    MyText(
                        text: 'Master desired\nlanguage',
                        weight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 14,
                        alignment: TextAlign.start)
                  ],
                ),
                Image.asset(
                  'assets/onboarding_two.png',
                  height: size.height * 0.1,
                  width: size.width * 0.15,
                  fit: BoxFit.cover,
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
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
