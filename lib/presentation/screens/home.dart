import 'package:flutter/material.dart';
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
            )
          ],
        ),
      ),
    );
  }
}
