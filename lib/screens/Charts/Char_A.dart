import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CalorieData {
  final String day;
  final int calories;
  final bool withinTarget;
  CalorieData(this.day, this.calories, this.withinTarget);
}

class CaloriesChart extends StatefulWidget {
  const CaloriesChart({super.key, required this.isDark});
  final bool isDark;

  @override
  State<CaloriesChart> createState() => _CaloriesChartState();
}

class _CaloriesChartState extends State<CaloriesChart> {
  @override
  Widget build(BuildContext context) {
    final List<CalorieData> data = [
      CalorieData("Sat", 2400, true),
      CalorieData("Mon", 2500, true),
      CalorieData("Tue", 2550, true),
      CalorieData("Wed", 2450, true),
      CalorieData("Thu", 2600, true),
      CalorieData("Fri", 2800, false),
      CalorieData("Sun", 2500, true),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Your Fat intake is higher than needed',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          'Lowering it will support your weight loss journey',
          style: TextStyle(color: widget.isDark ? Colors.white : Colors.black),
        ),
        SfCartesianChart(
          plotAreaBorderWidth: 0,

          primaryXAxis: CategoryAxis(
            majorGridLines: MajorGridLines(width: 0),
            axisLine: AxisLine(width: 0),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),

          primaryYAxis: NumericAxis(
            minimum: 2000,
            maximum: 3000,
            isVisible: false,
          ),
          series: [
            ColumnSeries<CalorieData, String>(
              dataSource: data,
              xValueMapper: (CalorieData cd, _) => cd.day,
              yValueMapper: (CalorieData cd, _) => cd.calories,
              borderRadius: BorderRadius.circular(50),
              width: 0.2,
              color: Colors.redAccent,
            ),
          ],
          annotations: data.map((d) {
            return CartesianChartAnnotation(
              widget: Icon(
                d.withinTarget ? Icons.check : Icons.close,
                color: widget.isDark ? Colors.white : Colors.black,
                size: 20,
              ),
              coordinateUnit: CoordinateUnit.point,
              x: d.day,
              y: d.calories.toDouble() + 70,
            );
          }).toList(),
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
                    'Protein Intake',
                    style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '84%',
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
                    'Fat intake',
                    style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '120%',
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
                    'Carbs Intake',
                    style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '95%',
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
