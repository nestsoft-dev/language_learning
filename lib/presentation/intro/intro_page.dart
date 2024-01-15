import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning/presentation/widgets/appbar.dart';
import 'package:language_learning/presentation/widgets/intro_list_card.dart';
import 'package:language_learning/presentation/widgets/intro_page_six.dart';

import '../../constant/constant.dart';
import '../widgets/intro_last_page.dart';
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

  bool _isSelected = false;
  int? _selectedIndex;
  String? selectedLang;

  late List<Map<String, String>> getList;
  checkList(int index) {
    if (index == 0) {
      ///   setState(() {
      getList = intro_one_language;
      //   });
      return intro_one_language.length;
    } else if (index == 1) {
      // setState(() {
      getList = intro_two_reason;
      //  });
      return intro_two_reason.length;
    } else if (index == 2) {
      //   setState(() {
      getList = intro_three_knowledge;
      //  });
      return intro_three_knowledge.length;
    } else if (index == 3) {
      //  setState(() {
      getList = intro_four_age;
      //});
      return intro_four_age.length;
    } else if (index == 4) {
      //   setState(() {
      getList = intro_five_time;
      //  });
      return intro_five_time.length;
    } else {
      //  setState(() {
      getList = intro_six_hearabtus;
      //  });
      return intro_six_hearabtus.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
          itemCount: 8,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _isSelected = false;
              _selectedIndex = null;
            });
          },
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, indexPage) {
            return ListView(
              children: [
                MyAppBar(
                    onPressed: () {
                      if (indexPage > 0) {
                        _pageController.animateToPage(indexPage - 1,
                            duration: const Duration(microseconds: 300),
                            curve: Curves.linear);
                      }
                    },
                    text: 'Completed ${indexPage + 1}/8'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: indexPage == 6
                      ? PageSixIntro(
                          onTap: () {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                          },
                          selectedLang: selectedLang ?? '',
                        )
                      : indexPage == 7
                          ? const LastIntroPage()
                          : Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.15,
                                  child: Column(children: [
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    indexPage >= 7
                                        ? const SizedBox.shrink()
                                        : MyText(
                                            text: indexPage == 1
                                                ? '${headText[indexPage]}$selectedLang'
                                                : indexPage == 2
                                                    ? '${headText[indexPage]}$selectedLang'
                                                    : indexPage >= 6
                                                        ? ''
                                                        : '${headText[indexPage]}',
                                            weight: FontWeight.w500,
                                            color: Colors.white,
                                            fontSize: 22,
                                            alignment: TextAlign.center,
                                          ),
                                    SizedBox(
                                      height: size.height * 0.05,
                                    ),
                                  ]),
                                ),
                                indexPage >= 7
                                    ? SizedBox.shrink()
                                    : SizedBox(
                                        height: size.height * 0.8,
                                        width: size.width,
                                        child: Stack(
                                          children: [
                                            ListView.builder(
                                                itemCount: checkList(indexPage),
                                                itemBuilder: (_, index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        _isSelected =
                                                            !_isSelected;
                                                        _selectedIndex = index;
                                                      });
                                                      if (index == 0) {
                                                        setState(() {
                                                          selectedLang =
                                                              getList[index]
                                                                  ['lang'];
                                                        });
                                                      }
                                                    },
                                                    child: IntroListCard(
                                                        color: _selectedIndex ==
                                                                index
                                                            ? Colors.green
                                                            : null,
                                                        text: getList[index]
                                                                ['lang']
                                                            .toString(),
                                                        imagePath:
                                                            getList[index]
                                                                    ['flag']
                                                                .toString()),
                                                  );
                                                }),
                                            _isSelected
                                                ? Positioned(
                                                    bottom: 150,
                                                    left: 0,
                                                    right: 0,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 20),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          _pageController.nextPage(
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          300),
                                                              curve: Curves
                                                                  .linear);
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            600),
                                                                height: 60,
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        onBoardingButton,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12)),
                                                                child: Center(
                                                                  child: Text(
                                                                    'Next',
                                                                    style: GoogleFonts.fredoka(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                )),
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox.shrink()
                                          ],
                                        ),
                                      ),
                              ],
                            ),
                ),
              ],
            );
          }),
    );
  }
}
