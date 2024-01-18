import 'package:flutter/material.dart';
import 'package:language_learning/presentation/widgets/buttons.dart';

import '../../constant/constant.dart';
import 'mytext.dart';

class GoalCardThree extends StatelessWidget {
  final PageController controller;
  const GoalCardThree({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: size.height * 0.17,
              width: size.width * 0.37,
              decoration: BoxDecoration(
                  color: textInputColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                CircleAvatar(
                  backgroundColor: textInputColor.withOpacity(0.2),
                  backgroundImage: const AssetImage('assets/school.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const MyText(
                  text: 'Basic level',
                  weight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 17,
                  alignment: TextAlign.center,
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              height: size.height * 0.17,
              width: size.width * 0.37,
              decoration: BoxDecoration(
                  color: textInputColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(children: [
                CircleAvatar(
                  backgroundColor: textInputColor.withOpacity(0.2),
                  backgroundImage: const AssetImage('assets/calendar.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const MyText(
                  text: 'Learn more',
                  weight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 17,
                  alignment: TextAlign.center,
                ),
              ]),
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        const MyText(
          text: 'Learning for:',
          weight: FontWeight.w500,
          color: Colors.white,
          fontSize: 20,
          alignment: TextAlign.center,
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          height: 65,
          width: size.width,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: textInputColor, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(child: Image.asset('assets/clock.png')),
                const SizedBox(
                  width: 15,
                ),
                const MyText(
                    text: 'Average of 3/Month',
                    weight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16,
                    alignment: TextAlign.start),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.3,
        ),
        Button(
            onTap: () {
              controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease);
            },
            text: 'Confirm Goal')
      ],
    );
  }
}
