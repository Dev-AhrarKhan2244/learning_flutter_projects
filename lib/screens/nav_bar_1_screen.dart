import 'package:bmi/screens/Charts/Char_A.dart';
import 'package:flutter/material.dart';
import 'Charts/Chart_B.dart';
import 'Charts/Chart_C.dart';

// ignore: must_be_immutable
class FindNav extends StatefulWidget {
  final bool isDark;
  const FindNav({super.key, required this.isDark});

  @override
  State<FindNav> createState() => _FindNav();
}

class _FindNav extends State<FindNav> {
  int Currentindex = 0;
  @override
  Widget build(BuildContext context) {
    var charts = [
      CaloriesChart(isDark: widget.isDark),
      WeightChart(isDark: widget.isDark),
      ComboChart(isDark: widget.isDark),
    ];

    var chartsname = [
      'Food Journal: Nutrition Review',
      'Body Matrics:Weight , BMI , Fat',
      'Heart Health & Stress',
    ];

    void NextChart() {
      setState(() {
        Currentindex = (Currentindex + 1) % charts.length;
      });
    }

    void PreviousChart() {
      setState(() {
        print(Currentindex);
        Currentindex = (Currentindex - 1 + charts.length) % charts.length;
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '<',
                    style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  '5 Mar - 13 Mar, 2025',
                  style: TextStyle(
                    color: widget.isDark ? Colors.white : Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '>',
                    style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            charts[Currentindex],

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    PreviousChart();
                  },
                  child: Text(
                    '<',
                    style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  chartsname[Currentindex],
                  style: TextStyle(
                    color: widget.isDark ? Colors.white : Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    NextChart();
                  },
                  child: Text(
                    '>',
                    style: TextStyle(
                      color: widget.isDark ? Colors.white : Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              height: 70,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 2),
                color: const Color.fromARGB(255, 251, 239, 134),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(text: 'Today you took '),
                      TextSpan(
                        text: '23% less calories ',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(text: 'than your average, Keep your '),
                      TextSpan(
                        text: 'protein intake to atleast 80%',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text:
                            ' of recommended value even if you are trying to loose weight.',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
