import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/nav/nav.dart';

import 'package:language_learning/presentation/pages/onboarding_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return const NavPage();
            } else if (!snapshot.hasData) {
              return const OnBoardingPage();
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
}
