import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/appbar.dart';
import 'package:language_learning/presentation/widgets/buttons.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

import '../widgets/plans_card.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({super.key});

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  bool _selected = false;
  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              MyAppBar(
                text: 'Subscription',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              MyText(
                  text: 'To continue,please select \na subscription',
                  weight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 20,
                  alignment: TextAlign.center),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.check_box_rounded,
                    color: onBoardingButton,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MyText(
                      text:
                          'There are hundred lessons from beginner to\n advance',
                      weight: FontWeight.w300,
                      color: Colors.grey,
                      fontSize: 13,
                      alignment: TextAlign.start),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.check_box_rounded,
                    color: onBoardingButton,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MyText(
                      text:
                          'The study of culture, travel and business\nthrough special courses.',
                      weight: FontWeight.w300,
                      color: Colors.grey,
                      fontSize: 13,
                      alignment: TextAlign.start),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              // const Row(
              //   children: [
              //     Icon(
              //       Icons.check_box_rounded,
              //       color: onBoardingButton,
              //     ),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     MyText(
              //         text:
              //             'There are hundred lessons from beginner to\n advance',
              //         weight: FontWeight.w300,
              //         color: Colors.grey,
              //         fontSize: 13,
              //         alignment: TextAlign.start),
              //   ],
              // ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                  height: size.height * 0.65,
                  child: Stack(
                    children: [
                      ListView.builder(
                          itemCount: 3,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(bottom: 15),
                          itemBuilder: (_, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                  _selected = !_selected;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: PlanCard(
                                  color: _selectedIndex == index && _selected
                                      ? appBarColor
                                      : null,
                                ),
                              ))),
                      _selected
                          ? Positioned(
                              bottom: 35,
                              left: 0,
                              right: 0,
                              child: Button(onTap: () {}, text: 'Update Plan'))
                          : const SizedBox.shrink()
                    ],
                  )),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
