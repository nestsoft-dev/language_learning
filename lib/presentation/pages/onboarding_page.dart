import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning/presentation/auth/register.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constant/constant.dart';
import '../widgets/buttons.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
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
      backgroundColor: onBoardingBg,
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: PageView.builder(
                  onPageChanged: (index) {},
                  controller: _pageController,
                  itemCount: onBoardingList.length,
                  itemBuilder: (_, index) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * 0.08,
                          ),
                          Image.asset(
                            onBoardingList[index]['image'].toString(),
                            height: 234.62,
                            width: 215,
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          SmoothPageIndicator(
                              controller: _pageController, // PageController
                              count: onBoardingList.length,
                              effect: const WormEffect(
                                  dotHeight: 10,
                                  dotWidth: 10,
                                  activeDotColor: orange,
                                  dotColor: Color.fromARGB(255, 47, 47,
                                      47)), // your preferred effect
                              onDotClicked: (index) {}),
                          SizedBox(
                            height: size.height * 0.08,
                          ),
                          Text(
                            onBoardingList[index]['title'].toString(),
                            style: GoogleFonts.fredoka(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              onBoardingList[index]['description'].toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.fredoka(
                                  fontSize: 18, color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                        ],
                      ))),
          SizedBox(
            height: size.height * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Button(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const RegisterPage())),
                    text: 'Choose a language'),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a user?',
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.fredoka(fontSize: 18, color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Log in',
                          style: GoogleFonts.fredoka(
                              fontSize: 18, color: const Color(0xfff5B7BFE)),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
