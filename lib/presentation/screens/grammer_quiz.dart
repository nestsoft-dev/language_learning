import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:language_learning/presentation/widgets/grammer_box.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

import '../../constant/constant.dart';
import '../../data/utils/snack_bars.dart';
import '../widgets/appbar.dart';
import '../widgets/buttons.dart';
import '../widgets/grammer_options.dart';
import '../widgets/mytext.dart';

class GrammerQuiz extends StatefulWidget {
  const GrammerQuiz({super.key});

  @override
  State<GrammerQuiz> createState() => _GrammerQuizState();
}

class _GrammerQuizState extends State<GrammerQuiz> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedIndex = null;
                      calculatePercent(index);
                    });
                  },
                  physics: const NeverScrollableScrollPhysics(),
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
                                gradientColor: const LinearGradient(colors: [
                                  onBoardingButton,
                                  onBoardingButton
                                ]),
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
                        SizedBox(
                          height: size.height * 0.08,
                          child: Center(
                            child: Image.asset('assets/translator.png'),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        const Center(
                          child: MyText(
                              text: 'Grammar Quiz:\nPresent Tense',
                              weight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 30,
                              alignment: TextAlign.center),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        const Center(
                          child: MyText(
                              text: 'Fill in the gaps',
                              weight: FontWeight.w300,
                              color: Colors.grey,
                              fontSize: 18,
                              alignment: TextAlign.start),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          child: MyText(
                              text: 'Complete the Sentence',
                              weight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 16,
                              alignment: TextAlign.start),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        const Center(
                          child: MyText(
                              text:
                                  'Fill in the blank with an appropriate present\ntense form.',
                              weight: FontWeight.w300,
                              color: Colors.grey,
                              fontSize: 18,
                              alignment: TextAlign.start),
                        ),

                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        GrammerBox(),
                        //option Box
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: SizedBox(
                            height: size.height * 0.15,
                            child: Center(
                              child: GridView.builder(
                                  itemCount: 6,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 15,
                                          mainAxisExtent: 45,
                                          mainAxisSpacing: 15),
                                  itemBuilder: (_, indexGrid) =>
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _selectedIndex = indexGrid;
                                            });
                                          },
                                          child: GrammerOption(
                                            color: _selectedIndex == indexGrid
                                                ? orange
                                                : null,
                                          ))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),

                        _selectedIndex != null
                            ? Button(
                                onTap: () {
                                  normalSnack(context, 'Correct answer!',
                                      'You have answer correctly');
                                  _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                text: 'Submit')
                            : const SizedBox.shrink()
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
