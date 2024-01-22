import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/data/utils/functions.dart';
import 'package:language_learning/presentation/widgets/appbar.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';
import 'package:translator_plus/translator_plus.dart';

class LanguageTranslatorPage extends StatefulWidget {
  const LanguageTranslatorPage({super.key});

  @override
  State<LanguageTranslatorPage> createState() => _LanguageTranslatorPageState();
}

class _LanguageTranslatorPageState extends State<LanguageTranslatorPage> {
  String _language = 'Korean';
  String _language_code = '';
  final _langFromText = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _langFromText.dispose();
  }

  final translator = GoogleTranslator();
  String translatedText = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              text: 'My Translator',
              //  onPressed: () => Navigator.of(context).pop(),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: appBarColor),
                    child: Row(
                      children: [
                        const MyText(
                            text: 'Translate To =>  ',
                            weight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 18,
                            alignment: TextAlign.left),
                        const SizedBox(
                          width: 15,
                        ),
                        DropdownButton(
                          underline: const SizedBox(),
                          value: _language,

                          // ignore: avoid_types_as_parameter_names
                          items: const [
                            DropdownMenuItem(
                              value: 'English',
                              child: MyText(
                                  text: 'English',
                                  weight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 18,
                                  alignment: TextAlign.left),
                            ),
                            DropdownMenuItem(
                              value: 'French',
                              child: MyText(
                                  text: 'French',
                                  weight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 18,
                                  alignment: TextAlign.left),
                            ),
                            const DropdownMenuItem(
                              value: 'German',
                              child: MyText(
                                  text: 'German',
                                  weight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 18,
                                  alignment: TextAlign.left),
                            ),
                            const DropdownMenuItem(
                              value: 'Hindi',
                              child: MyText(
                                  text: 'Hindi',
                                  weight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 18,
                                  alignment: TextAlign.left),
                            ),
                            const DropdownMenuItem(
                              value: 'Korean',
                              child: MyText(
                                  text: 'Korean',
                                  weight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 18,
                                  alignment: TextAlign.left),
                            ),
                            const DropdownMenuItem(
                              value: 'Bengali',
                              child: MyText(
                                  text: 'Bengali',
                                  weight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 18,
                                  alignment: TextAlign.left),
                            ),
                            const DropdownMenuItem(
                              value: 'Italian',
                              child: MyText(
                                  text: 'Italian',
                                  weight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 18,
                                  alignment: TextAlign.left),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _language = '$value';
                              _language_code = getLanguageCode(_language);
                            });
                            print(_language_code);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    height: size.height * 0.2,
                    width: size.width,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: textInputColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: _langFromText,
                      maxLines: 5,
                      onSubmitted: (value) async {
                        setState(() {
                          _isLoading = true;
                        });
                        await value.translate(to: _language_code).then((value) {
                          setState(() {
                            translatedText = '$value';
                            _isLoading = false;
                          });
                        });
                      },
                      keyboardType: TextInputType.name,
                      style: GoogleFonts.fredoka(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          hintText: 'Enter the word you wish to translate',
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.fredoka(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: orange,
                          ),
                        )
                      : MyText(
                          text: translatedText,
                          weight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 15,
                          alignment: TextAlign.left)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*chisomcollinsco@gmail.com,collinscobaba@gmail.com,pyplexpert@gmail.com,ikennasimonbusiness@gmail.com,ikennatechs@gmail.com,loisdearie8@gmail.com, perfectsolutionhub92@gmail.com, Dubemellis1@gmail.com,imafidononus@gmail.com,osinkbaba56@gmail.com,johndanielonoruoiza@gmail.com,orduenvictor02@gmail.com,olashileayo8@gmail.com,iakaakuma@gmail.com,abrahamcourage188@gmail.com,alabiifeoluwa199@gmail.com,Ellisedechime@gmail.com,dhonlekzy@gmail.com,Cardinal42k@gmail.com,oghojaforandrew17@gmail.com*/
