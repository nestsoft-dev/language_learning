import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/buttons.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class GoalPageFourth extends StatefulWidget {
  final PageController controller;
  const GoalPageFourth({super.key, required this.controller});

  @override
  State<GoalPageFourth> createState() => _GoalPageFourthState();
}

class _GoalPageFourthState extends State<GoalPageFourth> {
  final List<String> _imagePaths = [
    'assets/calendar.png',
    'assets/calendar.png',
    'assets/calendar.png',
    'assets/calendar.png',
  ];
  int? _currentIndex;
  final List<String> _names = [
    'Around BreakFast',
    'On The Go',
    'Around Lunchtime',
    'Around Dinner Time',
  ];
  final List<String> _morning = [
    '8:00 Am',
    '9:00 Am',
    '10:00 Am',
  ];
  final List<String> __ontheGo = [
    '10:00 Am',
    '11:00 Am',
    '12:00 Am',
  ];
  final List<String> _afternoon = [
    '12:00 Pm',
    '1:00 Pm',
    '2:00 Pm',
  ];
  final List<String> _night = [
    '7:00 Pm',
    '8:00 Pm',
    '9:00 Pm',
  ];

  int? _timerSelected;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.35,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _imagePaths.length,
              itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: _card(
                          context,
                          _imagePaths[index],
                          _currentIndex == index ? timerColor : textInputColor,
                          _names[index]),
                    ),
                  )),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        _currentIndex == null
            ? const SizedBox.shrink()
            : const MyText(
                text: 'What time?',
                weight: FontWeight.w500,
                color: Colors.white,
                fontSize: 22,
                alignment: TextAlign.start),
        SizedBox(
          height: size.height * 0.008,
        ),
        _currentIndex == null
            ? const SizedBox.shrink()
            : SizedBox(
                height: size.height * 0.05,
                child: ListView.builder(
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _timerSelected = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: _timeCard(
                              _currentIndex == 0
                                  ? _morning[index]
                                  : _currentIndex == 1
                                      ? __ontheGo[index]
                                      : _currentIndex == 2
                                          ? _afternoon[index]
                                          : _night[index],
                              _timerSelected == index
                                  ? timerColor
                                  : textInputColor),
                        ),
                      );
                    }),
              ),
        SizedBox(
          height: size.height * 0.09,
        ),
        _currentIndex == null || _timerSelected == null
            ? const SizedBox.shrink()
            : Button(
                onTap: () {
                  widget.controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                text: 'Next')
      ],
    );
  }
}

Widget _timeCard(String text, Color color) {
  return Container(
    height: 15,
    width: 100,
    // padding: const EdgeInsets.all(10),
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(18)),
    child: Center(
      child: MyText(
          text: text,
          weight: FontWeight.w500,
          color: color == textInputColor ? Colors.grey : Colors.white,
          fontSize: 13,
          alignment: TextAlign.start),
    ),
  );
}

Widget _card(
    BuildContext context, String imagePath, Color? color, String name) {
  final size = MediaQuery.of(context).size;
  return Container(
    height: 65,
    padding: const EdgeInsets.all(15),
    width: size.width,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(18)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              child: Image.asset(imagePath),
            ),
            const SizedBox(
              width: 15,
            ),
            MyText(
                text: name,
                weight: FontWeight.w500,
                color: Colors.white,
                fontSize: 15,
                alignment: TextAlign.start)
          ],
        ),
        Icon(
          Icons.check,
          size: 15,
          color: color == textInputColor ? Colors.grey : Colors.white,
        )
      ],
    ),
  );
}
