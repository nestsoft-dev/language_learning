import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import 'buttons.dart';
import 'mytext.dart';

class GoalCardTwo extends StatefulWidget {
  final PageController controller;
  const GoalCardTwo({super.key, required this.controller});

  @override
  State<GoalCardTwo> createState() => _GoalCardTwoState();
}

class _GoalCardTwoState extends State<GoalCardTwo> {
  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.70,
      child: Stack(
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: goalCardTwo.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: card(goalCardTwo[index], context,
                        _selectedIndex == index ? timerColor : textInputColor),
                  ),
                );
              }),
          SizedBox(
            height: size.height * 0.1,
          ),
          _selectedIndex != null
              ? Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Button(
                      onTap: () {
                        widget.controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                      text: 'Next'),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

Widget card(String title, BuildContext contex, Color? color) {
  final size = MediaQuery.of(contex).size;
  return Container(
    height: 65,
    width: size.width * 0.13,
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: color ?? textInputColor,
        borderRadius: BorderRadius.circular(20)),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyText(
              text: title,
              weight: FontWeight.w500,
              color: Colors.white,
              fontSize: 16,
              alignment: TextAlign.start),
        ],
      ),
    ),
  );
}
