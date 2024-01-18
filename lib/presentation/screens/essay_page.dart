import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

import '../../constant/constant.dart';
import '../../data/utils/snack_bars.dart';
import '../widgets/appbar.dart';
import '../widgets/buttons.dart';
import '../widgets/linear_question.dart';
import '../widgets/mytext.dart';

class EassyPage extends StatefulWidget {
  const EassyPage({super.key});

  @override
  State<EassyPage> createState() => _EassyPageState();
}

class _EassyPageState extends State<EassyPage> {
  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  double perval = 0.0;
  double calculatePercent(int page) {
    perval = page / 1000 * 30;

    return perval;
  }

  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = null;
                    calculatePercent(index);
                  });
                },
                itemCount: 31,
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemBuilder: (_, index) {
                  return ListView(
                    children: [
                      MyAppBar(
                        text: '',
                        middleChild: Column(
                          children: [
                            SimpleAnimationProgressBar(
                              height: 20,
                              width: 300,
                              backgroundColor: Colors.grey,
                              foregrondColor: Colors.purple,
                              ratio: calculatePercent(index),
                              direction: Axis.horizontal,
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(seconds: 3),
                              borderRadius: BorderRadius.circular(10),
                              gradientColor: const LinearGradient(
                                  colors: [onBoardingButton, onBoardingButton]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MyText(
                                text: '${index}/30',
                                weight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 15,
                                alignment: TextAlign.center)
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        lastChild: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      const MyText(
                          text: 'Select the Correct Word',
                          weight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 20,
                          alignment: TextAlign.start),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: textInputColor),
                            child: const Icon(
                              Icons.volume_up,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                  text: 'jongen',
                                  weight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 20,
                                  alignment: TextAlign.start),
                              SizedBox(
                                width: 10,
                              ),
                              DottedDashedLine(
                                height: 0,
                                width: 100,
                                axis: Axis.horizontal,
                                dashColor: Colors.grey,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      //option Box
                      SizedBox(
                        height: size.height * 0.52,
                        child: ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, indexList) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = indexList;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: _eassyOption(
                                        'Hoi',
                                        'Hello!',
                                        _selectedIndex == indexList
                                            ? Colors.blue.withOpacity(0.2)
                                            : null,
                                        context),
                                  ),
                                )),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                      _selectedIndex != null
                          ? Button(
                              onTap: () {
                                normalSnack(context, 'Correct answer!',
                                    'You have answer correctly');
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              },
                              text: 'Submit')
                          : const SizedBox.shrink()
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

Widget _eassyOption(
    String title, String meaning, Color? color, BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Container(
      height: 85,
      padding: const EdgeInsets.all(15),
      width: size.width,
      decoration: BoxDecoration(
          border: Border.all(
              color: color == null
                  ? const Color.fromARGB(144, 158, 158, 158)
                  : Colors.blue),
          color: color == null ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
                color == null ? Icons.check_circle_outline : Icons.check_circle,
                color: color == null
                    ? const Color.fromARGB(144, 158, 158, 158)
                    : Colors.blue),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                    text: title,
                    weight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18,
                    alignment: TextAlign.center),
                MyText(
                    text: title,
                    weight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18,
                    alignment: TextAlign.center),
              ],
            )
          ],
        ),
        const SizedBox()
      ]),
    ),
  );
}
