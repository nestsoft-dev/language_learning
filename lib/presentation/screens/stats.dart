import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/appbar.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyAppBar(text: 'Progress'),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyText(
                    text: 'Course',
                    weight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 20,
                    alignment: TextAlign.start),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: 50,
                  width: size.width,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: onBoardingButton),
                    color: Color.fromARGB(82, 61, 99, 250),
                  ),
                  child: Center(
                    child: DropdownButton(
                      underline: const SizedBox(),
                      value: 'German Language',
                      items: [
                        DropdownMenuItem(
                            value: 'German Language',
                            child: Text(
                              'German Language',
                              style:
                                  GoogleFonts.federo(color: onBoardingButton),
                            )),
                        DropdownMenuItem(
                            value: 'French Language',
                            child: Text(
                              'French Language',
                              style:
                                  GoogleFonts.federo(color: onBoardingButton),
                            )),
                        DropdownMenuItem(
                            value: 'Spanish Language',
                            child: Text(
                              'Spanish Language',
                              style:
                                  GoogleFonts.federo(color: onBoardingButton),
                            )),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var day in [
                        'Mon',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                        'Sat',
                        'Sun'
                      ])
                        Column(
                          children: [
                            Container(
                              height: day == 'Thu' ? 110 : 70,
                              width: day == 'Thu' ? 15 : 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: day == 'Thu'
                                    ? Colors.orange
                                    : Colors.grey[400],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(day),
                          ],
                        ),
                    ],
                  ),
                ),
                const MyText(
                    text: 'Completed Task',
                    weight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 22,
                    alignment: TextAlign.start)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25)
                    .copyWith(bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 0.5, color: onBoardingButton)),
                  child: ListTile(
                    leading: Icon(Icons.check_circle_outline),
                    title: Text('Lesson ${index + 1}'),
                    subtitle: const Text('Completed'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
