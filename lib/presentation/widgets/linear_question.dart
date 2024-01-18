import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:language_learning/data/utils/snack_bars.dart';
import 'package:language_learning/presentation/widgets/buttons.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

import '../../constant/constant.dart';

import 'appbar.dart';
import 'learning_optionbox.dart';
import 'mytext.dart';

class LinearQuestionWidget extends StatefulWidget {
  const LinearQuestionWidget(
      {super.key,
      required this.controller,
      required this.percentVal,
      required this.pageNum});
  final PageController controller;
  final double percentVal;
  final int pageNum;

  @override
  State<LinearQuestionWidget> createState() => _LinearQuestionWidgetState();
}

class _LinearQuestionWidgetState extends State<LinearQuestionWidget> {
  int? _selectedIndex;

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
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: LearningOptionBox(
                        color: _selectedIndex == index ? timerColor : null,
                        imagePath: 'assets/italy.png',
                        text: 'italy'),
                  )),
        ),
        SizedBox(
          height: size.height * 0.1,
          child: const Center(
            child: MyText(
                text: 'This is the hint of what the image means',
                weight: FontWeight.w200,
                color: Colors.grey,
                fontSize: 15,
                alignment: TextAlign.start),
          ),
        ),
        _selectedIndex != null
            ? Button(
                onTap: () {
                  normalSnack(
                      context, 'Correct answer!', 'You have answer correctly');
                  widget.controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
                text: 'Submit')
            : const SizedBox.shrink()
      ],
    );
  }
}
