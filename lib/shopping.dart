import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Shopping extends StatelessWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
            child: Row(
              children: [
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width*0.90,
                  lineHeight: 30.0,
                  percent: 1/4,
                  progressColor: Colors.white,
                  backgroundColor: Colors.orange,
                  barRadius: const Radius.circular(16),
                ),
              ],
            )
    )
    );
  }
}