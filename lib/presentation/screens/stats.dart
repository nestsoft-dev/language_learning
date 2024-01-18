import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning/bar%20graph/bar_graph.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/widgets/appbar.dart';
import 'package:language_learning/presentation/widgets/mytext.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  List<double> weeklySummary = [4.0, 2.50, 42.42, 10.50, 100.20, 88.99, 90.10];
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
                    color: const Color.fromARGB(82, 61, 99, 250),
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
                SizedBox(
                  height: size.height * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MyText(
                          text: 'Progress',
                          weight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 18,
                          alignment: TextAlign.start),
                      Container(
                        height: 47,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: textInputColorShade),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: MyText(
                              text: 'This Week',
                              weight: FontWeight.w300,
                              color: Colors.grey,
                              fontSize: 15,
                              alignment: TextAlign.center),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: size.height * 0.23,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: MyBarGraph(
                    weeklySummary: weeklySummary,
                  ),
                  //  Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     for (var day in [
                  //       'Mon',
                  //       'Tue',
                  //       'Wed',
                  //       'Thu',
                  //       'Fri',
                  //       'Sat',
                  //       'Sun'
                  //     ])
                  //       Column(
                  //         mainAxisAlignment: MainAxisAlignment.end,
                  //         children: [
                  //           Container(
                  //             height: day == 'Thu' ? 110 : 70,
                  //             width: day == 'Thu' ? 15 : 8,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(4),
                  //               color: day == 'Thu'
                  //                   ? Colors.orange
                  //                   : Colors.grey[400],
                  //             ),
                  //           ),
                  //           const SizedBox(height: 8),
                  //           Text(day),
                  //         ],
                  //       ),
                  //   ],
                  // ),
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
                    leading: const Icon(Icons.check_circle_outline),
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
