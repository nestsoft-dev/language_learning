// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:language_learning/data/utils/snack_bars.dart';
import 'package:language_learning/model/user_model.dart';
import 'package:language_learning/presentation/nav/nav.dart';

import '../../presentation/intro/intro_page.dart';
import '../utils/functions.dart';

class FireBaseFunc {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance.collection('Users');

  Future<void> registerUser(
      BuildContext context, UserModel user, String fcm) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      await _firestore
          .doc(_auth.currentUser!.uid)
          .set(user.toMap())
          .then((value) {
        sendFCMmessages(fcm, 'Registered', 'Welcome to lanligo');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const IntroPage()),
            (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      errorSnack(context, 'Error', e.toString());
    } catch (e) {
      errorSnack(context, 'Error', e.toString());
    }
  }

  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    try {
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const NavPage()),
            (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      errorSnack(context, 'Error', e.toString());
    } catch (e) {
      errorSnack(context, 'Error', e.toString());
    }
  }

  Stream<UserModel> getUserData() {
    return _firestore.doc(_auth.currentUser!.uid).snapshots().map(
        (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
  }
}
