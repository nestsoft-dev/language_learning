import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class PlanCard extends StatelessWidget {
  final Color? color;
  final String name;
  final String amount;
  const PlanCard(
      {super.key, this.color, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.20,
      width: size.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: color ?? textInputColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                  text: name,
                  weight: FontWeight.w300,
                  color: Colors.grey,
                  fontSize: 15,
                  alignment: TextAlign.center),
              SizedBox(
                height: size.height * 0.008,
              ),
              Text(
                amount,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 20),
              ),
              // MyText(
              //     text: amount,
              //     weight: FontWeight.w500,
              //     color: Colors.white,
              //     fontSize: 20,
              //     alignment: TextAlign.center),
              SizedBox(
                height: size.height * 0.008,
              ),
              MyText(
                  text: 'Your monthly subscription\n can be cancel any time',
                  weight: FontWeight.w300,
                  color: Colors.grey,
                  fontSize: 15,
                  alignment: TextAlign.start),
            ],
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: orange, borderRadius: BorderRadius.circular(12)),
            child: const Center(
              child: MyText(
                  text: '1 week free trial',
                  weight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 15,
                  alignment: TextAlign.center),
            ),
          )
        ],
      ),
    );
  }
}
