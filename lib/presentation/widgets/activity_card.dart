import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class ActivityCaard extends StatelessWidget {
  const ActivityCaard({super.key, required this.time});
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(13),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: textInputColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/clock.png',
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        text: 'Total hours',
                        weight: FontWeight.w300,
                        color: Colors.grey,
                        fontSize: 15,
                        alignment: TextAlign.center),
                    MyText(
                        text: time,
                        weight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 14,
                        alignment: TextAlign.start),
                  ],
                ),
              ],
            ),
            Container(
              height: 38,
              // width: size.width * 0.50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent,
                  border: Border.all(color: onBoardingButton, width: 1)),
              child: const Center(
                child: MyText(
                    text: 'This Week',
                    weight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 12,
                    alignment: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
