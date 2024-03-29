import 'package:flutter/material.dart';
import 'package:language_learning/presentation/nav/nav.dart';

import 'package:language_learning/presentation/widgets/buttons.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class LastIntroPage extends StatelessWidget {
  const LastIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: size.height * 0.42,
              width: size.width * 0.7,
              child: Image.asset(
                'assets/congratulation.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const MyText(
              text: 'Congratulations',
              weight: FontWeight.w600,
              color: Colors.white,
              fontSize: 30,
              alignment: TextAlign.center),
          const SizedBox(
            height: 25,
          ),
          const MyText(
              text: 'Please click the continue button\n to Get started.',
              weight: FontWeight.w200,
              color: Colors.grey,
              fontSize: 16,
              alignment: TextAlign.center),
          SizedBox(
            height: size.height * 0.1,
          ),
          Button(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const NavPage()));
              },
              text: 'Continue')
        ],
      ),
    );
  }
}
