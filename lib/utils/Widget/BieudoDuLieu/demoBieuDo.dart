import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyBarChart extends StatefulWidget {
  const MyBarChart({Key? key}) : super(key: key);

  @override
  State<MyBarChart> createState() => _MyBarChartState();
}

class _MyBarChartState extends State<MyBarChart> {
  final int totalBars = 60;
  final Random random = Random();

  late List<double> barData;
  late List<bool> isIncrease;
  late List<double> purpleLine;
  late List<double> orangeLine;

  @override
  void initState() {
    super.initState();

    // Dữ liệu cột
    barData = List.generate(
      totalBars,
      (i) => 0.1 + random.nextDouble() * 1,
    );

    // Tăng giảm xen kẽ
    isIncrease = List.generate(totalBars, (i) => i % 2 == 0);

    // Đường tím: lấy trung bình cộng quanh cột
    purpleLine = [];
    for (int i = 0; i < totalBars; i++) {
      double avg = 0;
      int count = 0;
      for (int j = i - 2; j <= i + 2; j++) {
        if (j >= 0 && j < totalBars) {
          avg += barData[j];
          count++;
        }
      }
      purpleLine.add(avg / count);
    }

    // Đường cam: dao động nhẹ dựa trên đường tím
    orangeLine = List.generate(
      totalBars,
      (i) => purpleLine[i] + (random.nextDouble() - 0.5) * 0.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double barWidth = screenWidth / totalBars;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Stack(
          children: [
            BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceEvenly,
                maxY: 5,
                barGroups: List.generate(totalBars, (i) {
                  return BarChartGroupData(
                    x: i,
                    barsSpace: 0,
                    barRods: [
                      BarChartRodData(
                        toY: barData[i],
                        width: barWidth,
                        color: isIncrease[i] ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ],
                  );
                }),
                titlesData: FlTitlesData(show: false),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barTouchData: BarTouchData(enabled: false),
              ),
            ),
            LineChart(
              LineChartData(
                minY: 0,
                maxY: 5,
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                      totalBars,
                      (i) => FlSpot(i.toDouble(), purpleLine[i]),
                    ),
                    isCurved: true,
                    color: Colors.purpleAccent,
                    barWidth: 2,
                    dotData: const FlDotData(show: false),
                  ),
                  LineChartBarData(
                    spots: List.generate(
                      totalBars,
                      (i) => FlSpot(i.toDouble(), orangeLine[i]),
                    ),
                    isCurved: true,
                    color: Colors.orangeAccent,
                    barWidth: 2,
                    dotData: const FlDotData(show: false),
                  ),
                ],
                titlesData: const FlTitlesData(show: false),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
