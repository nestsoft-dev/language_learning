import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class HomeAppBar extends StatelessWidget {
  final String firstname;
  const HomeAppBar({super.key, required this.firstname});

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
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/italy.png'),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notification_important_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                    text: 'Hello, $firstname',
                    weight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 25,
                    alignment: TextAlign.start),
                const SizedBox(
                  height: 5,
                ),
                const MyText(
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
