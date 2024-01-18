// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:language_learning/bar%20graph/bar_data.dart';
import 'package:language_learning/constant/constant.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;
  const MyBarGraph({
    Key? key,
    required this.weeklySummary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sunAmount: weeklySummary[0],
        monAmount: weeklySummary[1],
        tueAmount: weeklySummary[2],
        wedAmount: weeklySummary[3],
        thurAmount: weeklySummary[4],
        fridayAmount: weeklySummary[5],
        satAmount: weeklySummary[6]);
    myBarData.initializeBarData();
    return BarChart(BarChartData(
        maxY: 100,
        minY: 0,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          show: false,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true, getTitlesWidget: getBottomTitle)),
        ),
        barGroups: myBarData.barData
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: orange,
                    width: 25,
                    backDrawRodData: BackgroundBarChartRodData(
                        show: true, toY: 100, color: textInputColor),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ]))
            .toList()));
  }
}

Widget getBottomTitle(double value, TitleMeta meta) {
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Sun');
      break;
    case 1:
      text = const Text('Mon');
      break;
    case 2:
      text = const Text('Tue');
      break;
    case 3:
      text = const Text('Wed');
      break;
    case 4:
      text = const Text('Thur');
      break;
    case 5:
      text = const Text('Fri');
      break;
    case 6:
      text = const Text('Sat');
      break;
    default:
      text = const Text('');
      break;
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
