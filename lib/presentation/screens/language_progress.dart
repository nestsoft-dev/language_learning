// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fl_chart/fl_chart.dart' as chart;

// class LanguageProgress {
//   final String language;
//   int progress;

//   LanguageProgress(this.language, this.progress);
// }

// class LanguageProgressChart extends StatefulWidget {
//   @override
//   _LanguageProgressChartState createState() => _LanguageProgressChartState();
// }

// class _LanguageProgressChartState extends State<LanguageProgressChart> {
//   List<LanguageProgress> _languageProgressList = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadLanguageProgressData();
//   }

//   Future<void> _loadLanguageProgressData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _languageProgressList = [
//         LanguageProgress('English', prefs.getInt('english') ?? 0),
//         LanguageProgress('Spanish', prefs.getInt('spanish') ?? 0),
//         LanguageProgress('French', prefs.getInt('french') ?? 0),
//         LanguageProgress('German', prefs.getInt('german') ?? 0),
//       ];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<LanguageProgress, String>> seriesList = [
//       charts.Series(
//         id: 'Language Progress',
//         data: _languageProgressList,
//         domainFn: (LanguageProgress progress, _) => progress.language,
//         measureFn: (LanguageProgress progress, _) => progress.progress,
//         colorFn: (LanguageProgress progress, _) =>
//             charts.ColorUtil.fromDartColor(Colors.blue),
//       ),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Language Progress Chart'),
//       ),
//       body: Center(
//         child: Container(
//           height: 400,
//           padding: EdgeInsets.all(20),
//           child: charts.BarChart(
//             seriesList,
//             animate: true,
//             vertical: false,
//             barRendererDecorator: charts.BarLabelDecorator<String>(),
//             domainAxis: charts.OrdinalAxisSpec(
//               renderSpec: charts.NoneRenderSpec(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
