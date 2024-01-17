// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';

import 'package:language_learning/presentation/widgets/buttons.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class PageSixIntro extends StatelessWidget {
  void Function() onTap;
  final String selectedLang;
  PageSixIntro({
    Key? key,
    required this.onTap,
    required this.selectedLang,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          const MyText(
              text: 'Course Overview',
              weight: FontWeight.w500,
              color: Colors.white,
              fontSize: 17, alignment: TextAlign.center,),
          const SizedBox(
            height: 10,
          ),
          MyText(
              text:
                  'Learn listening, speaking, reading and\nwriting in $selectedLang',
              weight: FontWeight.w200,
              color: Colors.grey,
              fontSize: 15, alignment: TextAlign.start,),
          const SizedBox(
            height: 25,
          ),
          const MyText(
              text: 'Course Content:',
              weight: FontWeight.w500,
              color: Colors.white,
              fontSize: 17,alignment: TextAlign.center,),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                height: size.height * 0.17,
                width: size.width * 0.37,
                decoration: BoxDecoration(
                    color: textInputColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  CircleAvatar(
                    backgroundColor: textInputColor.withOpacity(0.2),
                    backgroundImage: AssetImage('assets/word.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const MyText(
                      text: '9000+',
                      weight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 17, alignment: TextAlign.center,),
                  const MyText(
                      text: 'Words',
                      weight: FontWeight.w200,
                      color: Colors.grey,
                      fontSize: 15, alignment: TextAlign.center,),
                ]),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                height: size.height * 0.17,
                width: size.width * 0.37,
                decoration: BoxDecoration(
                    color: textInputColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  CircleAvatar(
                    backgroundColor: textInputColor.withOpacity(0.2),
                    backgroundImage: AssetImage('assets/sentences.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const MyText(
                      text: '2100+',
                      weight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 17, alignment: TextAlign.center,),
                  const MyText(
                      text: 'Sentence',
                      weight: FontWeight.w200,
                      color: Colors.grey,
                      fontSize: 15, alignment: TextAlign.center,),
                ]),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.35,
          ),
          Button(onTap: onTap, text: 'Next')
        ],
      ),
    );
  }
}
