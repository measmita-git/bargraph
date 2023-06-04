import 'package:bar_graph/bar%20graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;

  const MyBarGraph({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sunAmount: weeklySummary[0],
        monAmount: weeklySummary[1],
        tueAmount: weeklySummary[2],
        wedAmount: weeklySummary[3],
        thurAmount: weeklySummary[4],
        friAmount: weeklySummary[5],
        satAmount: weeklySummary[6]);
    myBarData.initializeBarData();
    // var data;
    return BarChart(BarChartData(
      maxY: 50,
      minY: 0,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(
        show: false,
        // border: Border(left: BorderSide.none, right: BorderSide.none),
      ),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles:
              SideTitles(showTitles: true, getTitlesWidget: getBottomTitles),
        ),
      ),
      barGroups: myBarData.barData
          .map((data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    width: 30,
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ],
              ))
          .toList(),
    ));
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  Widget text;

  switch (value.toInt()) {
    case 1:
      text = Text(
        'S',
        style: style,
      );
      break;
    case 2:
      text = Text(
        'M',
        style: style,
      );
      break;
    case 3:
      text = Text(
        'T',
        style: style,
      );
      break;
    case 4:
      text = Text(
        'W',
        style: style,
      );
      break;
    case 5:
      text = Text(
        'T',
        style: style,
      );
      break;
    case 6:
      text = Text(
        'F',
        style: style,
      );
      break;
    case 7:
      text = Text(
        'S',
        style: style,
      );
      break;
    default:
      text = Text(
        '',
        style: style,
      );
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
