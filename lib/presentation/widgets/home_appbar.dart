import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.20,
      color: appBarColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/italy.png'),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notification_important_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                    text: 'Hello, Ikenna',
                    weight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 25,
                    alignment: TextAlign.start),
                SizedBox(
                  height: 5,
                ),
                MyText(
                    text: 'What who you like to learn today?',
                    weight: FontWeight.w100,
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
