import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/data/firebase/firebase_func.dart';
import 'package:language_learning/data/utils/functions.dart';
import 'package:language_learning/presentation/pages/learning_page.dart';
import 'package:language_learning/presentation/screens/subscription_plan.dart';

import 'package:language_learning/presentation/widgets/course_card.dart';
import 'package:language_learning/presentation/widgets/featured_courses.dart';
import 'package:language_learning/presentation/widgets/home_appbar.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';
import 'package:onepref/onepref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/display_lan.dart';
import 'set_weekly_goal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? _appStartTime;
  DateTime? _appEndTime;
  Duration _totalTime = Duration.zero;
  bool _isSubscribe = false;

  final _iapEngine = IApEngine();

  //lsit of products
  final List<ProductId> _productIds = [
    ProductId(id: weekly, isConsumable: false),
    ProductId(id: monthly, isConsumable: false),
    ProductId(id: threemonths, isConsumable: false),
  ];

  List<ProductDetails> _products = [];

  //iap

  Future<void> listenPurchase(List<PurchaseDetails> list) async {
    if (list.isNotEmpty) {
      for (PurchaseDetails purchaseDetails in list) {
        if (purchaseDetails.status == PurchaseStatus.restored ||
            purchaseDetails.status == PurchaseStatus.purchased) {
          Map purchaseData = jsonDecode(
              purchaseDetails.verificationData.localVerificationData);
          if (purchaseData['acknowledged']) {
            setState(() {
              OnePref.setPremium(_isSubscribe);
              _isSubscribe = true;
            });
          } else {
            if (Platform.isAndroid) {
              final InAppPurchaseAndroidPlatformAddition
                  androidPlatformAddition =
                  _iapEngine.inAppPurchase.getPlatformAddition();
              await androidPlatformAddition
                  .consumePurchase(purchaseDetails)
                  .then((value) {
                setState(() {
                  _isSubscribe = true;
                  OnePref.setPremium(_isSubscribe);
                });
              });
            }
            if (purchaseDetails.pendingCompletePurchase) {
              await _iapEngine.inAppPurchase
                  .completePurchase(purchaseDetails)
                  .then((value) {
                setState(() {
                  _isSubscribe = true;
                  OnePref.setPremium(_isSubscribe);
                });
              });
            }
          }
        }
      }
    } else {
      setState(() {
        _isSubscribe = false;
        OnePref.setPremium(_isSubscribe);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCourse();
    _iapEngine.inAppPurchase.purchaseStream.listen((event) {
      listenPurchase(event);
    });
    loadTime();
  }

  loadTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _totalTime = Duration(seconds: prefs.getInt('total_time') ?? 0);
    });
  }

  List<DisplayCourseLan> courseList = [];

  Future<void> getCourse() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? gottenCourse = prefs.getStringList('course');

    gottenCourse!.forEach((element) async {
      final int counter = await prefs.getInt('${element}$courseNum') ?? 0;
      setState(() {
        _isSubscribe = OnePref.getPremium() ?? false;
        courseList.add(DisplayCourseLan(element, counter));
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    calculateTime();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder(
          stream: FireBaseFunc().getUserData(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    HomeAppBar(
                      firstname: snapshot.data!.firstName,
                    ),
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
                        height: size.height * 0.29,
                        child: ListView.builder(
                            itemCount: courseList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) => Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (_) => LearningPage(
                                                    lan_code: getLanguageCode(
                                                        courseList[index]
                                                            .courseName),
                                                    language: courseList[index]
                                                        .courseName,
                                                  )));
                                    },
                                    child: CourseCard(
                                      color:
                                          index == 0 ? onBoardingButton : null,
                                      percent: courseList[index].courseNumber <
                                              20
                                          ? courseList[index].courseNumber /
                                              20 *
                                              100
                                          : courseList[index].courseNumber >
                                                      20 &&
                                                  courseList[index]
                                                          .courseNumber <
                                                      50
                                              ? courseList[index].courseNumber /
                                                  50 *
                                                  100
                                              : courseList[index].courseNumber /
                                                  40 *
                                                  100,
                                      number: courseList[index].courseNumber,
                                      title: courseList[index].courseName,
                                    ),
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
                            itemCount: featureList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) => GestureDetector(
                                onTap: () {
                                  if (_isSubscribe) {
                                    featureCardNav(context, index);
                                  } else {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const SubscriptionPlan()));
                                  }
                                },
                                child: FeaturedCoursesCard(
                                  subtitle: featureList[index]['description']!,
                                  title: featureList[index]['title']!,
                                  imagePath: featureList[index]['image']!,
                                ))),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const SetWeeklyGoal()));
                        },
                        child: Container(
                          height: size.height * 0.15,
                          width: size.width,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: textInputColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Row(children: [
                            CircleAvatar(
                              backgroundColor: textInputColorShade,
                              backgroundImage: AssetImage('assets/target.png'),
                            ),
                            SizedBox(
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
                                SizedBox(
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
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    // _isLoaded
                    //     ? SizedBox(
                    //         width: 728,
                    //         height: 90,
                    //         child: AdWidget(ad: _bannerAd!),
                    //       )
                    //     : const SizedBox.shrink(),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error: 404'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: orange,
                ),
              );
            }
          }),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _appStartTime = DateTime.now();
    } else if (state == AppLifecycleState.paused) {
      _appEndTime = DateTime.now();
      _totalTime += _appEndTime!.difference(_appStartTime!);
      _appStartTime = null;
      _appEndTime = null;
    }
  }
}
