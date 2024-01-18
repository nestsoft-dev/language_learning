// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class GrammerOption extends StatelessWidget {
  final Color? color;
  const GrammerOption({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color ?? onBoardingBg,
          border: Border.all(color: textInputColorShade),
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: MyText(
            text: 'Will go',
            weight: FontWeight.w300,
            color: color != null ? Colors.white : Colors.grey,
            fontSize: 15,
            alignment: TextAlign.center),
      ),
    );
  }
}
