import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/appbar.dart';
import 'package:language_learning/presentation/widgets/buttons.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _pageController = PageController(initialPage: 0);
    @override
    void dispose() {
      _pageController.dispose();
      super.dispose();
    }

    int _pageIndex = 0;

    return Scaffold(
      body: Column(
        children: [
          _pageIndex == 0
              ? MyAppBar(
                  text: '',
                  middleChild: SizedBox(),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  lastChild: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                )
              : MyAppBar(
                  text: '',
                  middleChild: Column(
                    children: [
                      SimpleCircularProgressBar(
                        size: 100,
                        backColor: textInputColorShade,
                        // valueNotifier: valueNotifier,
                        mergeMode: true,
                        onGetText: (value) {
                          return Text(
                            '${value.toInt()}/30',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
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
            height: size.height * 0.1,
          ),
          Expanded(
            child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemBuilder: (_, index) {
                  return index > 0
                      ? SizedBox()
                      : ListView(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.3,
                                    child: const Placeholder(),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                  const MyText(
                                      text: 'Learning Tip',
                                      weight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 25,
                                      alignment: TextAlign.center),
                                  SizedBox(
                                    height: size.height * 0.002,
                                  ),
                                  MyText(
                                      text:
                                          'Hear it loud and clear; tirn up the\nvolume or use headphones',
                                      weight: FontWeight.w200,
                                      color: Colors.grey,
                                      fontSize: 16,
                                      alignment: TextAlign.center),
                                  SizedBox(
                                    height: size.height * 0.19,
                                  ),
                                  Button(
                                      onTap: () {
                                        _pageController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.ease);
                                      },
                                      text: 'Got it!'),
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                }),
          ),
        ],
      ),
    );
  }
}
