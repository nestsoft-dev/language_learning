import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:language_learning/presentation/widgets/appbar.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

import '../../constant/constant.dart';

class InviteFriendPage extends StatelessWidget {
  const InviteFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(
            text: 'Invite Friends',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            height: size.height * 0.13,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.25,
                  child: const Placeholder(),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                const MyText(
                    text: 'Invite your Friends',
                    weight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 30,
                    alignment: TextAlign.center),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const MyText(
                    text: 'Learn together with friends',
                    weight: FontWeight.w300,
                    color: Colors.grey,
                    fontSize: 15,
                    alignment: TextAlign.center),
                SizedBox(
                  height: size.height * 0.12,
                ),
                Column(
                  children: [
                    //whatsBut
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: onBoardingButton,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.wechat_sharp,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Whatsapp',
                                  style: GoogleFonts.fredoka(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: size.height * 0.007,
                    ),

                    //text
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: onBoardingButton),
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.wechat_sharp,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Text Message',
                                  style: GoogleFonts.fredoka(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: size.height * 0.007,
                    ),

                    //share but
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: onBoardingButton),
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Iconsax.menu,
                                  color: Colors.white,
                                ),
                                Text(
                                  'More Options',
                                  style: GoogleFonts.fredoka(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
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
