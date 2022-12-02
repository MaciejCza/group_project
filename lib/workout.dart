import 'package:percent_indicator/linear_percent_indicator.dart';

import 'main.dart';
import 'app.dart';
import 'package:flutter/material.dart';

const br = Text('', style: TextStyle(fontSize: 20));
const brsmol = Text('', style: TextStyle(fontSize: 10));
const brsmoll = Text('', style: TextStyle(fontSize: 5));
bool isChecked = false;

class Workout extends StatelessWidget {
  const Workout({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.grey),
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(color: Colors.orange),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width - 14,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Column(children: [
                            const Text('Weekly workout progress',
                                style: TextStyle(fontSize: 20)),
                            br,
                            LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width * 0.90,
                              lineHeight: 7,
                              percent: 1 / 4,
                              progressColor: Colors.white,
                              backgroundColor: Colors.orange,
                              barRadius: const Radius.circular(16),
                            ),
                            brsmol,
                            const Text('1 out of 4 workouts',
                                style: TextStyle(fontSize: 10))
                          ])),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width - 14,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Column(children: [
                            const Text('Today workout',
                                style: TextStyle(fontSize: 20)),
                            Align(
                                alignment: Alignment.topRight,
                                child: Row(children: <Widget>[
                                  Text(
                                      'Today workout                                       ',
                                      style: TextStyle(fontSize: 20)),
                                  Checkbox(
                                    checkColor: Colors.black,
                                    value: isChecked,
                                    onChanged: (bool? value) {},
                                  )
                                ])),
                          ])),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                      )
                    ]))));
  }
}
