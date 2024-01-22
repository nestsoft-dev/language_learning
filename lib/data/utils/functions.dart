import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning/presentation/screens/grammer_quiz.dart';
import 'package:language_learning/presentation/screens/guess_meaning.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant/constant.dart';
import '../../model/display_lan.dart';
import '../../presentation/screens/essay_page.dart';
import '../../presentation/screens/writing_page.dart';

void sendFCMmessages(String token, String title, String message) async {
  final endpoint = "https://fcm.googleapis.com/fcm/send";
  final header = {
    'Authorization':
        'key=AAAAuBT03wo:APA91bGgMAEVczhp4o9rUshJ7iEnxrkxfzVxkbZJ57t9-GUnX5rF05NSr2IDC4KE_VKQZJP9xBHANakIymZJWJSr9BcxzWf6WXYHaEiOzvzApqI49Uq3FkWE7FhxKr6LNTO1WCb37RZ_',
    'Content-Type': 'application/json'
  };
  http
      .post(Uri.parse(endpoint),
          headers: header,
          body: jsonEncode({
            "to": token,
            "notification": {
              "body": message,
              "title": title,
              "sound": "default"
            }
          }))
      .then((value) {
    print(
        'Firebase mEssaging response is${value.statusCode} ${value.toString()}');
  });
}

void addCourse(String cours) async {
  List<String> courseList = [cours];
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // ignore: avoid_function_literals_in_foreach_calls
  courseList.forEach((element) async {
    await prefs.setInt('$element$courseNum', 0);
  });
  await prefs.setStringList('course', courseList);
}

Future<void> updateLanguageData(String language, int progress) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int currentProgress = prefs.getInt('$language$courseNum') ?? 0;
  await prefs.setInt('$language$courseNum', currentProgress + progress);
  List<String> courseList = [language];
  await prefs.setStringList('course', courseList);
}

// Future<List<DisplayCourseLan>> getCourse() async {
//   List<DisplayCourseLan> courseList = [];
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   List<String> gottenCourse = prefs.getStringList('course') ?? [];

//   gottenCourse.forEach((element) async {

//     courseList.add(DisplayCourseLan(element, 0));
//   });
//   return courseList;
// }

void shareInvite() async {
  // final result = await Share.shareWithResult(
  //     'check out these language learning app i use in learning, Download it form the link here: https://play.google.com/store/apps/details?id=com.enginesos.language.language_learning&hl=en&gl=US');

  // if (result.status == ShareResultStatus.success) {}
}

String getLanguageCode(String languageCode) {
  String code = '';
  switch (languageCode) {
    case 'English':
      code = 'en_US';
      print('Language  Code is $code');
      break;
    case 'French':
      code = 'fr';
      print('Language  Code is $code');
      break;
    case 'German':
      code = 'de';
      print('Language  Code is $code');
      break;
    case 'Hindi':
      code = 'hi';
      print('Language  Code is $code');
      break;
    case 'Korean':
      code = 'ko';
      print('Language  Code is $code');
      break;
    case 'Bengali':
      code = 'bn';
      print('Language  Code is $code');
      break;
    case 'Italian':
      code = 'it';
      print('Language  Code is $code');
      break;
    default:
  }
  return code;
}

void readToUser(String text, String? langCode) async {
  // TextToSpeech tts = TextToSpeech();
  // String language = langCode ?? 'en-US';
  // tts.setLanguage(language);
  // await tts.speak(text);
}

void calculateTime() async {
  DateTime? _appStartTime;
  DateTime? _appEndTime;
  Duration _totalTime = Duration.zero;
  SharedPreferences prefs = await SharedPreferences.getInstance();

  _totalTime = Duration(seconds: prefs.getInt('total_time') ?? 0);
  await prefs.setInt('total_time', _totalTime.inMinutes);
}

void featureCardNav(BuildContext context, index) {
  switch (index) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const GrammerQuiz()));
      break;
    case 1:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const EassyPage()));
      break;
    case 2:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const WritingQuiz()));
      break;
    case 3:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const GuessTheMeaning()));
      break;
    default:
  }
}

learningBottomSnack(BuildContext context, Color backgroundColor,
        String complements, String buttonText, void Function() onTap) =>
    showModalBottomSheet(
        context: context,
        builder: (_) => Container(
              height: 300,
              padding: const EdgeInsets.all(25),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                children: [
                  MyText(
                      text: complements,
                      weight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 19,
                      alignment: TextAlign.start),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => onTap,
                    child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            buttonText,
                            style: GoogleFonts.fredoka(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
            ));
