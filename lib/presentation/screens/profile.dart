import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/screens/settings_page.dart';
import 'package:language_learning/presentation/widgets/activity_card.dart';
import 'package:language_learning/presentation/widgets/appbar.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              text: 'Profile',
              lastChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const SettingsPage()));
                  },
                  child: const Icon(
                    Iconsax.setting,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            const MyText(
                text: 'Ikenna Obetta',
                weight: FontWeight.w600,
                color: Colors.white,
                fontSize: 28,
                alignment: TextAlign.center),
            SizedBox(
              height: size.height * 0.003,
            ),
            const MyText(
                text: 'Joined March 2023',
                weight: FontWeight.w300,
                color: Colors.grey,
                fontSize: 15,
                alignment: TextAlign.center),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: 52,
              width: size.width * 0.50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(59, 91, 124, 254),
                  border: Border.all(color: onBoardingButton, width: 1)),
              child: const Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      text: 'Add Language',
                      weight: FontWeight.w400,
                      color: onBoardingButton,
                      fontSize: 15,
                      alignment: TextAlign.center),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.add,
                    color: onBoardingButton,
                  )
                ],
              )),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            const Row(
              children: [
                DottedDashedLine(
                  height: 0,
                  width: 100,
                  axis: Axis.horizontal,
                  dashColor: textInputColor,
                ),
                DottedDashedLine(
                  height: 0,
                  width: 100,
                  axis: Axis.horizontal,
                  dashColor: textInputColor,
                ),
                DottedDashedLine(
                  height: 0,
                  width: 100,
                  axis: Axis.horizontal,
                  dashColor: textInputColor,
                ),
                DottedDashedLine(
                  height: 0,
                  width: 100,
                  axis: Axis.horizontal,
                  dashColor: textInputColor,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                      text: 'My Activity',
                      weight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20,
                      alignment: TextAlign.start),
                  MyText(
                      text: 'View all',
                      weight: FontWeight.w100,
                      color: Colors.grey,
                      fontSize: 14,
                      alignment: TextAlign.end),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const ActivityCaard(),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                      text: 'Achievement',
                      weight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20,
                      alignment: TextAlign.start),
                  MyText(
                      text: 'View all',
                      weight: FontWeight.w100,
                      color: Colors.grey,
                      fontSize: 14,
                      alignment: TextAlign.end),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      backgroundImage: AssetImage('assets/word.png'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const MyText(
                      text: '9000+',
                      weight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 17,
                      alignment: TextAlign.center,
                    ),
                    const MyText(
                      text: 'Words',
                      weight: FontWeight.w200,
                      color: Colors.grey,
                      fontSize: 15,
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
                      backgroundImage: AssetImage('assets/sentences.png'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const MyText(
                      text: '2100+',
                      weight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 17,
                      alignment: TextAlign.center,
                    ),
                    const MyText(
                      text: 'Sentence',
                      weight: FontWeight.w200,
                      color: Colors.grey,
                      fontSize: 15,
                      alignment: TextAlign.center,
                    ),
                  ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
