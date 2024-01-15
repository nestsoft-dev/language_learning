// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'mytext.dart';

class IntroMotherPage extends StatefulWidget {
  final List<Map<String, String>> list;
  final String headText;
  const IntroMotherPage({
    Key? key,
    required this.list,
    required this.headText,
  }) : super(key: key);

  @override
  State<IntroMotherPage> createState() => _IntroMotherPageState();
}

class _IntroMotherPageState extends State<IntroMotherPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.75,
      child: Column(
        children: [
          const MyText(
            text: 'What is Language do you want to Learn?',
            weight: FontWeight.w500,
            color: Colors.white,
            fontSize: 22,
            alignment: TextAlign.center,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
