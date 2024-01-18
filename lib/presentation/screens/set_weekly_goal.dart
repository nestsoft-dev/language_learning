import 'package:flutter/material.dart';
import 'package:language_learning/main.dart';
import 'package:language_learning/presentation/widgets/appbar.dart';
import 'package:language_learning/presentation/widgets/goal_card_one.dart';
import 'package:language_learning/presentation/widgets/goal_last_page.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

import '../widgets/goal_card_three.dart';
import '../widgets/goal_card_two.dart';
import '../widgets/goal_fourth_card.dart';

class SetWeeklyGoal extends StatefulWidget {
  const SetWeeklyGoal({super.key});

  @override
  State<SetWeeklyGoal> createState() => _SetWeeklyGoalState();
}

class _SetWeeklyGoalState extends State<SetWeeklyGoal> {
  final _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _pageIndex = 0;
  final List<String> _headText = [
    'Which level do you want to reach?',
    'By when do you want to reach basic level?',
    'Your Language Goal',
    'When would you like to learn?',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(
            text: 'Set Goal',
            onPressed: () {
              if (_pageIndex == 0) {
                Navigator.of(context).pop();
              } else if (_pageIndex > 0 || _pageIndex < 5) {
                _pageController.animateToPage(_pageIndex - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Expanded(
              child: PageView.builder(
                  itemCount: 5,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  //physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ListView(
                        children: [
                          MyText(
                              text: _headText[index],
                              weight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20,
                              alignment: TextAlign.start),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          index == 0
                              ? GoalCardOne(
                                  controller: _pageController,
                                )
                              : index == 1
                                  ? GoalCardTwo(controller: _pageController)
                                  : index == 2
                                      ? GoalCardThree(
                                          controller: _pageController)
                                      : index == 3
                                          ? GoalPageFourth(
                                              controller: _pageController)
                                          : const GoalLastPage()
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
