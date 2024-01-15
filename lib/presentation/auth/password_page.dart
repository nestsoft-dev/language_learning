import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning/presentation/auth/login.dart';
import 'package:language_learning/presentation/intro/intro_page.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

import '../../constant/constant.dart';
import '../widgets/appbar.dart';
import '../widgets/buttons.dart';
import '../widgets/textinput.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              text: 'Signup',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            SizedBox(
              height: size.height * 0.05,
            ),
            const MyText(
                text: 'Choose a Passsword',
                weight: FontWeight.w500,
                color: Colors.white,
                fontSize: 22, alignment: TextAlign.center,),
            SizedBox(
              height: size.height * 0.05,
            ),
            MyTextInput(
                titleText: 'Create Password',
                placeHolderText: '**************',
                controller: _password,
                obscureText: true,
                type: TextInputType.emailAddress),

            //last name
            SizedBox(
              height: size.height * 0.03,
            ),
            MyTextInput(
                titleText: 'Confirm Password',
                placeHolderText: '************',
                controller: _confirmPassword,
                obscureText: true,
                type: TextInputType.name),

            SizedBox(
              height: size.height * 0.25,
            ),
            Button(
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const IntroPage())),
                text: 'Signup'),
            SizedBox(
              height: size.height * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DottedDashedLine(
                    height: 0,
                    width: 100,
                    axis: Axis.horizontal,
                    dashColor: textInputColor,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Or',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  DottedDashedLine(
                    height: 0,
                    width: 100,
                    axis: Axis.horizontal,
                    dashColor: textInputColor,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already a member?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.fredoka(fontSize: 18, color: Colors.grey),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const LoginPage()));
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.fredoka(
                          fontSize: 18, color: const Color(0xfff5B7BFE)),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
