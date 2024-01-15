import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex:3,      
              child: PageView.builder(
                itemCount: onBoardingList.length,
                itemBuilder: (_,index)=>Column()) ),SizedBox(height: size.height*0.3,)
      ],),
    );
  }
}