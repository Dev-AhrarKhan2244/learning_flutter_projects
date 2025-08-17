import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ComboChart extends StatefulWidget {
  const ComboChart({super.key});

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
    return SfCartesianChart(
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
    );
  }
}

class ChartData {
  final String x;
  final double value;
  final double range;

  ChartData(this.x, this.value, this.range);
}
