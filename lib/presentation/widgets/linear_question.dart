import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:language_learning/data/utils/snack_bars.dart';
import 'package:language_learning/presentation/widgets/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:translator_plus/translator_plus.dart';

import '../../constant/constant.dart';

import 'appbar.dart';
import 'learning_optionbox.dart';
import 'mytext.dart';

class LinearQuestionWidget extends StatefulWidget {
  Map<String, dynamic> data;
  LinearQuestionWidget(
      {super.key,
      required this.controller,
      required this.percentVal,
      required this.pageNum,
      required this.data,
      required this.language,
      required this.lan_code});
  final PageController controller;
  final double percentVal;
  final int pageNum;
  final String language;
  final String lan_code;

  @override
  State<LinearQuestionWidget> createState() => _LinearQuestionWidgetState();
}

class _LinearQuestionWidgetState extends State<LinearQuestionWidget> {
  int? _selectedIndex;
  var _selectedAnswer;
  final translator = GoogleTranslator();

  Future<void> checkAnser(
      String selectedOption, String answerOption, int questionNumber) async {
    if (selectedOption == answerOption) {
      normalSnack(context, 'Correct answer!', 'You have answer correctly');
      widget.controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('${widget.language}$courseNum', questionNumber);
    } else {
      errorSnack(context, 'Wrong Answer', 'Check the answer');
    }
  }

  @override
  void initState() {
    super.initState();
    translateAll(widget.pageNum);
  }

  String word = '';
  String answer = '';
  String? hint;
  List<String> _options = [];
  List<String> _image = [];
  List<String> options = [];
  translateAll(int page) async {
    options = widget.data['options'];
    options.forEach((element) async {
      String listWord =
          '${await translator.translate(element, to: widget.lan_code)}';
      setState(() {
        _options.add(listWord);
        _image.add(element);
      });
    });

    word =
        '${await translator.translate(widget.data['word'], to: widget.lan_code)}';
    answer =
        '${await translator.translate(widget.data['answer'], to: widget.lan_code)}';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                ratio: widget.percentVal,
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
                  text: '${widget.pageNum}/30',
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
            text: 'Select the Correct Image',
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyText(
                      // widget.data['word']
                      text: '$word',
                      weight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20,
                      alignment: TextAlign.start),
                ),
                SizedBox(
                  width: 5,
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
          height: size.height * 0.02,
        ),
        //option Box
        SizedBox(
          height: size.height * 0.52,
          child: GridView.builder(
              itemCount: _options.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                        _selectedAnswer = _options[_selectedIndex!];
                      });
                      print('Selected answer: ' + _selectedAnswer);
                      print('Answer:' + widget.data['answer']);
                    },
                    child: LearningOptionBox(
                        color: _selectedIndex == index
                            ? _selectedAnswer == answer //widget.data['answer']
                                ? timerColor
                                : Colors.red
                            : null,
                        imagePath: 'assets/${_image[index]}.png',
                        //widget.data['options'][index]
                        text: _selectedAnswer == answer ? _options[index] : ''),
                  )),
        ),
        SizedBox(
          height: size.height * 0.1,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: MyText(
                  text:
                      'This is the hint of what the image means ${widget.data['hint']}',
                  weight: FontWeight.w200,
                  color: Colors.grey,
                  fontSize: 15,
                  alignment: TextAlign.start),
            ),
          ),
        ),
        _selectedIndex != null
            ? Button(
                onTap: () => checkAnser(
                    _selectedAnswer as String, answer, widget.pageNum),
                text: 'Submit')
            : const SizedBox.shrink()
      ],
    );
  }
}
