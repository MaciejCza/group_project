import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
const br = Text('', style: TextStyle(fontSize: 20));

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
bool valuefirst = false;
bool values = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
            child: Container(
                height: MediaQuery.of(context).size.height*0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width*0.90,
                  lineHeight: 30.0,
                  percent: 1/4,
                  progressColor: Colors.white,
                  backgroundColor: Colors.orange,
                  barRadius: const Radius.circular(16),
                ),
              ]),
            )
    )
    );
  }
}