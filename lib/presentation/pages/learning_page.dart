// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:translator_plus/translator_plus.dart';

import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/appbar.dart';
import 'package:language_learning/presentation/widgets/buttons.dart';
import 'package:language_learning/presentation/widgets/linear_question.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

import '../../constant/learning_js.dart';
import '../widgets/learning_optionbox.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({
    Key? key,
    required this.language,
    required this.lan_code,
  }) : super(key: key);
  final String language;
  final String lan_code;

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  final _pageController = PageController(initialPage: 0);
  int _languageProgress = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrevisinState();
  }

  getPrevisinState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _languageProgress = await prefs.getInt('${widget.language}$courseNum') ?? 0;
  }

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
                    calculatePercent(index);
                  });
                },
                itemCount: english.length + 1,
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemBuilder: (_, index) {
                  return index > 0
                      ? LinearQuestionWidget(
                          controller: _pageController,
                          percentVal: calculatePercent(index),
                          pageNum: index,
                          data: english[_languageProgress],
                          language: widget.language,
                          lan_code: widget.lan_code,
                        )
                      : ListView(
                          children: [
                            MyAppBar(
                              text: '',
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.05,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.3,
                                    child: Image.asset(
                                      'assets/translator.png',
                                      fit: BoxFit.cover,
                                    ),
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
                                  const MyText(
                                      text:
                                          'Hear it loud and clear; turn up the\nvolume or use headphones',
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
