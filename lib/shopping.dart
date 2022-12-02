import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
            child: Row(
              children: [
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width*0.20,
                  lineHeight: 30.0,
                  percent: 1/4,
                  progressColor: Colors.white,
                  backgroundColor: Colors.orange,
                  barRadius: const Radius.circular(16),
                ),
                Checkbox(
                    checkColor: Colors.green,
                    activeColor: Colors.red,
                    value: this.valuefirst,
                    onChanged: (bool ?value) {
                    setState((){
                    this.valuefirst = values;
                  }
                    );})
              ],
            )
    )
    );
  }
}