import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/appbar.dart';
import 'package:language_learning/presentation/widgets/buttons.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';
import 'package:onepref/onepref.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import '../widgets/plans_card.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({super.key});

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  bool _selected = false;
  int? _selectedIndex;
  
  final _iapEngine = IApEngine();

  //lsit of products
  List<ProductId> _productIds = [
    ProductId(id: weekly, isConsumable: false),
    ProductId(id: monthly, isConsumable: false),
    ProductId(id: threemonths, isConsumable: false),
  ];

  List<ProductDetails> _products = [];

  //iap

  //bool
  bool _isSubscribe = false;

  @override
  void initState() {
    super.initState();
    getProducts();
    _iapEngine.inAppPurchase.purchaseStream.listen((event) {
      listenPurchase(event);
    });
  }

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

  getProducts() async {
    await _iapEngine.getIsAvailable().then((value) async {
      if (value) {
        await _iapEngine.queryProducts(_productIds).then((res) {
          setState(() {
            _products.addAll(res.productDetails);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: MyText(
                  text: 'To continue,please select \na subscription',
                  weight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 20,
                  alignment: TextAlign.center),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
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
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                  height: size.height * 0.65,
                  child: Stack(
                    children: [
                      ListView.builder(
                          itemCount: _products.length,
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
                                  name: _products[index].id,
                                  amount: _products[index].price,
                                ),
                              ))),
                      _selected
                          ? Positioned(
                              bottom: 35,
                              left: 0,
                              right: 0,
                              child: Button(
                                  onTap: () {
                                    _iapEngine.handlePurchase(
                                        _products[_selectedIndex!],
                                        _productIds);
                                  },
                                  text: 'Update Plan'))
                          : const SizedBox.shrink()
                    ],
                  )),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
