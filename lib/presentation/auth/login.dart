import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning/presentation/auth/register.dart';

import '../../constant/constant.dart';
import '../widgets/appbar.dart';
import '../widgets/buttons.dart';
import '../widgets/mytext.dart';
import '../widgets/textinput.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _password = TextEditingController();
  final _emailaddress = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              text: 'Login',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Image.asset('assets/login.png'),
            SizedBox(
              height: size.height * 0.02,
            ),
            const MyText(
              text: 'For free, join now and \nstart learning',
              weight: FontWeight.w500,
              color: Colors.white,
              fontSize: 22,
              alignment: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            MyTextInput(
                titleText: 'Email Address',
                placeHolderText: 'Enter your email address',
                controller: _emailaddress,
                obscureText: false,
                type: TextInputType.emailAddress),

            //last name
            SizedBox(
              height: size.height * 0.05,
            ),
            MyTextInput(
                titleText: 'Enter your Password',
                placeHolderText: 'Enter your password',
                controller: _password,
                obscureText: true,
                type: TextInputType.name),

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text(
                    'Forget Password',
                    style: GoogleFonts.fredoka(
                        fontSize: 15, color: const Color(0xFFE5E5E5)),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: size.height * 0.05,
            ),
            Button(onTap: () {}, text: 'Login'),
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
                  'New a member?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.fredoka(fontSize: 18, color: Colors.grey),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (_) => const RegisterPage()));
                    },
                    child: Text(
                      'Register',
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
