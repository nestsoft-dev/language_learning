import 'package:flutter/material.dart';
import 'package:language_learning/presentation/widgets/appbar.dart';

import '../widgets/mytext.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
          itemCount: 7,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return Column(
              children: [
                MyAppBar(onPressed: () {}, text: 'Completed ${index + 1}/7'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: size.height * 0.15,
                        child: Column(children: [
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const MyText(
                              text: 'What is Language do you want to Learn?',
                              weight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 22),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                        ]),
                      ),
                      ListView.builder(itemBuilder: (_,index){

                      })
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
