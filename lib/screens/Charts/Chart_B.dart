import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class WeightChart extends StatefulWidget {
  bool isDark;
  WeightChart({super.key, required this.isDark});

  @override
  State<WeightChart> createState() => _WeightChartState();
}

class _WeightChartState extends State<WeightChart> {
  late bool isDark;
  late List<ChartData> data;
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    data = [
      ChartData('Jan', 78),
      ChartData('Feb', 82),
      ChartData('Mar', 80),
      ChartData('Apr', 79),
      ChartData('May', 81),
      ChartData('Jun', 82.5),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
      ),

      primaryYAxis: NumericAxis(
        minimum: 78,
        maximum: 83,
        interval: 2,
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
      ),
      series: [
        SplineSeries<ChartData, String>(
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.month,
          yValueMapper: (ChartData data, _) => data.value,
          width: 4,
          onCreateShader: (ShaderDetails details) {
            return const LinearGradient(
              colors: [Colors.pink, Colors.purple],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(details.rect);
          },
        ),
      ],
    );
  }
}

class ChartData {
  final String month;
  final double value;
  ChartData(this.month, this.value);
}
