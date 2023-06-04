import 'package:bar_graph/bar_chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<double> weeklySummary = [
    24.4,
    39.5,
    30.5,
    10.5,
    12.5,
    43.5,
    9.4,
    60.7,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          child: MyBarGraph(
            weeklySummary: weeklySummary,
          ),
        ),
      ),
    );
  }
}
