import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ComboChart extends StatefulWidget {
  const ComboChart({super.key, required this.isDark});
  final bool isDark;
  @override
  State<ComboChart> createState() => _ComboChartState();
}

class _ComboChartState extends State<ComboChart> {
  final List<ChartData> data = [
    ChartData("Day1", 75, 85),
    ChartData("Day2", 72, 82),
    ChartData("Day3", 74, 78),
    ChartData("Day4", 69, 88),
    ChartData("Day5", 71, 83),
    ChartData("Day6", 70, 86),
    ChartData("Day7", 72, 80),
    ChartData("Day8", 71, 84),
  ];
  @override
  Widget build(BuildContext context) {
    widget.isDark;
    return Column(
      children: [
        Text(
          'Your Resting heartrate has dropped',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          'Indicating improced Cardiavascular health.Keep it up!',
          style: TextStyle(color: widget.isDark ? Colors.white : Colors.black),
        ),
        SizedBox(height: 20),
        SfCartesianChart(
          primaryXAxis: CategoryAxis(
            isVisible: false,
            majorGridLines: MajorGridLines(width: 0),
          ),
          primaryYAxis: NumericAxis(
            minimum: 50,
            maximum: 90,
            interval: 10,
            majorGridLines: MajorGridLines(width: 0),
          ),
          series: [
            ColumnSeries<ChartData, String>(
              dataSource: data,
              xValueMapper: (ChartData d, _) => d.x,
              yValueMapper: (ChartData d, _) => d.range,
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.2),
              width: 0.5,
            ),

            LineSeries<ChartData, String>(
              dataSource: data,
              xValueMapper: (ChartData d, _) => d.x,
              yValueMapper: (ChartData d, _) => d.value,
              color: Colors.redAccent,
              width: 2,
              markerSettings: const MarkerSettings(
                isVisible: true,
                shape: DataMarkerType.circle,
                color: Colors.white,
                borderWidth: 2,
                borderColor: Colors.redAccent,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(6),
              ),
              height: 60,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Peak HeartRate',
                    style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '145 BPM',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(6),
              ),
              height: 60,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Avg HeartRate',
                    style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '80-120',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(6),
              ),
              height: 60,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Stress',
                    style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Low',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class ChartData {
  final String x;
  final double value;
  final double range;

  ChartData(this.x, this.value, this.range);
}
