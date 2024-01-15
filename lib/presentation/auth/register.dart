import 'package:flutter/material.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning/presentation/auth/login.dart';
import 'package:language_learning/presentation/auth/password_page.dart';
import 'package:language_learning/presentation/widgets/appbar.dart';
import 'package:language_learning/presentation/widgets/buttons.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';
import 'package:language_learning/presentation/widgets/textinput.dart';

import '../../constant/constant.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _emailaddress = TextEditingController();
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
              height: size.height * 0.03,
            ),
            const MyText(
                text: 'Create an Account',
                weight: FontWeight.w500,
                color: Colors.white,
                fontSize: 22),
            SizedBox(
              height: size.height * 0.05,
            ),
            MyTextInput(
                titleText: 'First Name',
                placeHolderText: 'Enter your first name',
                controller: _firstName,
                obscureText: false,
                type: TextInputType.name),

            //last name
            SizedBox(
              height: size.height * 0.05,
            ),
            MyTextInput(
                titleText: 'Last Name',
                placeHolderText: 'Enter your last name',
                controller: _lastName,
                obscureText: false,
                type: TextInputType.name),

            //email
            SizedBox(
              height: size.height * 0.05,
            ),
            MyTextInput(
                titleText: 'Email Adress',
                placeHolderText: 'Enter your email address',
                controller: _emailaddress,
                obscureText: false,
                type: TextInputType.emailAddress),
            SizedBox(
              height: size.height * 0.05,
            ),
            Button(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const PasswordPage())),
                text: 'Continue'),
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
