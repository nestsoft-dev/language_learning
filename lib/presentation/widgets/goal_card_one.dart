import 'package:flutter/material.dart';
import 'package:language_learning/presentation/widgets/buttons.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

import '../../constant/constant.dart';

class GoalCardOne extends StatefulWidget {
  final PageController controller;
  const GoalCardOne({super.key, required this.controller});

  @override
  State<GoalCardOne> createState() => _GoalCardOneState();
}

class _GoalCardOneState extends State<GoalCardOne> {
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
              itemCount: goalCardOne.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: card(
                        goalCardOne[index]['title']!,
                        goalCardOne[index]['message']!,
                        context,
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

Widget card(String title, String message, BuildContext contex, Color? color) {
  final size = MediaQuery.of(contex).size;
  return Container(
    height: size.height * 0.13,
    width: size.width * 0.13,
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: color ?? textInputColor,
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
            text: title,
            weight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
            alignment: TextAlign.start),
        MyText(
            text: message,
            weight: FontWeight.w300,
            color: Colors.grey,
            fontSize: 14,
            alignment: TextAlign.start),
      ],
    ),
  );
}
