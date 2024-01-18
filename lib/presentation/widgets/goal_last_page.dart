import 'package:flutter/material.dart';
import 'package:language_learning/data/utils/snack_bars.dart';
import 'package:language_learning/presentation/widgets/buttons.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class GoalLastPage extends StatelessWidget {
  const GoalLastPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.01,
        ),
        SizedBox(
          height: size.height * 0.35,
          child: Placeholder(),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        const MyText(
            text: 'Goal Set',
            weight: FontWeight.w600,
            color: Colors.white,
            fontSize: 25,
            alignment: TextAlign.center),
        SizedBox(
          height: size.height * 0.01,
        ),
        const MyText(
            text: 'You\'ll complete 5 activities per\nweek',
            weight: FontWeight.w200,
            color: Colors.grey,
            fontSize: 14,
            alignment: TextAlign.center),
        SizedBox(
          height: size.height * 0.1,
        ),
        Button(
            onTap: () {
              sucessSnack(
                  context, 'Success', 'Your goal has been successfully set');
              Navigator.of(context).pop();
            },
            text: 'Got it')
      ],
    );
  }
}
