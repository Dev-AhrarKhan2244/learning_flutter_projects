import 'package:bmi/screens/Charts/Char_A.dart';
import 'package:flutter/material.dart';

class TaskOne extends StatelessWidget {
  final bool isDark;
  const TaskOne({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '<',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  '5 Mar - 13 Mar, 2025',
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '>',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            CaloriesChart(isDark: isDark),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '<',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  'Food Journal: Nutrition Review',
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '>',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
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
