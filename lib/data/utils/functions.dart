import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning/presentation/screens/grammer_quiz.dart';
import 'package:language_learning/presentation/screens/guess_meaning.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

import '../../presentation/screens/essay_page.dart';
import '../../presentation/screens/writing_page.dart';

// import 'package:text_to_speech/text_to_speech.dart';

void shareInvite() async {
  // final result = await Share.shareWithResult(
  //     'check out these language learning app i use in learning, Download it form the link here: https://play.google.com/store/apps/details?id=com.enginesos.language.language_learning&hl=en&gl=US');

  // if (result.status == ShareResultStatus.success) {}
}

void readToUser(String text, String? langCode) async {
  // TextToSpeech tts = TextToSpeech();
  // String language = langCode ?? 'en-US';
  // tts.setLanguage(language);
  // await tts.speak(text);
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
