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
    widget.isDark;
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          'You have gained weight unexpectedly',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          'Check your calorie intake and activity levels',
          style: TextStyle(color: widget.isDark ? Colors.white : Colors.black),
        ),
        SizedBox(height: 20),
        SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: CategoryAxis(
            majorGridLines: MajorGridLines(width: 0),
            axisLine: AxisLine(width: 0),
          ),

          primaryYAxis: NumericAxis(
            minimum: 78,
            maximum: 83,
            interval: 2,
            majorGridLines: MajorGridLines(width: 0),
            axisLine: AxisLine(width: 0),
          ),
          series: [
            SplineSeries<ChartData, String>(
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.value,
              width: 4,
              onCreateShader: (ShaderDetails details) {
                return LinearGradient(
                  colors: [Colors.pink, Colors.purple],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(details.rect);
              },
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
                    'Current Weight',
                    style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '82Kg',
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
                    'Current Bmi',
                    style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '28.6',
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
                    'Body Fat',
                    style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '22.6%',
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
  final String month;
  final double value;
  ChartData(this.month, this.value);
}
