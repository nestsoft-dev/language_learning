import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class CourseCard extends StatefulWidget {
  final Color? color;
  CourseCard({super.key, this.color});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  late ValueNotifier<double> valueNotifier;

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier(75.4);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.26,
      width: size.width * 0.42,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          color: widget.color ?? textInputColor,
          borderRadius: BorderRadius.circular(15)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: SimpleCircularProgressBar(
            size: 100,
            backColor:
                widget.color != null ? Colors.white : textInputColorShade,
            valueNotifier: valueNotifier,
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
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        const MyText(
            text: 'German',
            weight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
            alignment: TextAlign.start),
        SizedBox(
          height: size.height * 0.002,
        ),
        const MyText(
            text: 'Language',
            weight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
            alignment: TextAlign.start),
        Spacer(),
        const MyText(
            text: '20 Classes . Easy',
            weight: FontWeight.w200,
            color: Colors.grey,
            fontSize: 13,
            alignment: TextAlign.start),
      ]),
    );
  }
}
