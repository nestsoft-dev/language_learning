import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/course_card.dart';
import 'package:language_learning/presentation/widgets/featured_courses.dart';
import 'package:language_learning/presentation/widgets/home_appbar.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar(),
            SizedBox(
              height: size.height * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                      text: 'Continue Course',
                      weight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18,
                      alignment: TextAlign.start),
                  MyText(
                      text: 'See all',
                      weight: FontWeight.w100,
                      color: Colors.grey,
                      fontSize: 14,
                      alignment: TextAlign.end),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                height: size.height * 0.28,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CourseCard(
                            color: index == 0 ? onBoardingButton : null,
                          ),
                        )),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            //feature Courses
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                      text: 'Featured Courses',
                      weight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18,
                      alignment: TextAlign.start),
                  MyText(
                      text: 'See all',
                      weight: FontWeight.w100,
                      color: Colors.grey,
                      fontSize: 14,
                      alignment: TextAlign.end),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //feature course row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                height: size.height * 0.18,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => FeaturedCoursesCard()),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                height: size.height * 0.15,
                width: size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: textInputColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(children: [
                  CircleAvatar(
                    backgroundColor: textInputColorShade,
                    backgroundImage: AssetImage('assets/italy.png'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                          text: 'Set Weekly Goal!',
                          weight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 20,
                          alignment: TextAlign.start),
                      const SizedBox(
                        height: 10,
                      ),
                      MyText(
                          text:
                              'Who set a weekly goal are more\nlikely to stay motivated.',
                          weight: FontWeight.w100,
                          color: Colors.grey,
                          fontSize: 14,
                          alignment: TextAlign.start)
                    ],
                  )
                ]),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}