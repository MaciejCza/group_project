import 'package:percent_indicator/linear_percent_indicator.dart';

import 'main.dart';
import 'app.dart';
import 'package:flutter/material.dart';

const br = Text('', style: TextStyle(fontSize: 20));
const brsmol = Text('', style: TextStyle(fontSize: 10));
const brsmoll = Text('', style: TextStyle(fontSize: 5));
bool isChecked = true;

class Workout extends StatefulWidget {
  const Workout({Key? key}) : super(key: key);

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: Column(children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.77,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          decoration: const BoxDecoration(
                              color: Colors.orange,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ]),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.17,
                          child: Column(children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: const Image(
                                  image: AssetImage("assets/logo.png"),
                                )),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: const Text(
                                  'BusyBeePlanner',
                                  style: TextStyle(fontSize: 24),
                                ))
                          ])),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width - 14,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(children: [
                            const Text('Weekly workout progress',
                                style: TextStyle(fontSize: 20)),
                            br,
                            ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  topLeft: Radius.circular(40),
                                ),
                                child: LinearPercentIndicator(
                                  width:
                                      MediaQuery.of(context).size.width * 0.90,
                                  lineHeight: 8,
                                  percent: 1 / 4,
                                  progressColor: Colors.white,
                                  backgroundColor: Colors.orange,
                                  barRadius: const Radius.circular(160),
                                )),
                            brsmol,
                            const Text('1 out of 4 workouts',
                                style: TextStyle(fontSize: 10))
                          ])),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width - 14,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(children: [
                            const Text('Today workout',
                                style: TextStyle(fontSize: 20)),
                            Align(
                                alignment: Alignment.topRight,
                                child: Row(children: <Widget>[
                                  const Icon(
                                    Icons.fitness_center,
                                    color: Colors.orange,
                                    size: 24.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                  const Text(
                                      '  ABS and Back                                      ',
                                      style: TextStyle(fontSize: 20)),
                                  Checkbox(
                                    checkColor: Colors.black,
                                    value: isChecked,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    onChanged: (bool? value) {},
                                  )
                                ])),
                          ])),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width - 14,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(children: [
                            const Text('12.12.2022',
                                style: TextStyle(fontSize: 20)),
                            Align(
                                alignment: Alignment.topRight,
                                child: Row(children: <Widget>[
                                  const Icon(
                                    Icons.fitness_center,
                                    color: Colors.orange,
                                    size: 24.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                  const Text(
                                      ' Leg day                                                  ',
                                      style: TextStyle(fontSize: 20)),
                                  Checkbox(
                                    checkColor: Colors.black,
                                    value: isChecked,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    onChanged: (bool? value) {},
                                  )
                                ])),
                          ])),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width - 14,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(children: [
                            const Text('14.12.2022',
                                style: TextStyle(fontSize: 20)),
                            Align(
                                alignment: Alignment.topRight,
                                child: Row(children: <Widget>[
                                  const Icon(
                                    Icons.fitness_center,
                                    color: Colors.orange,
                                    size: 24.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                  const Text(
                                      ' Full body workout                                ',
                                      style: TextStyle(fontSize: 20)),
                                  Checkbox(
                                    checkColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    value: isChecked,
                                    onChanged: (bool? value) {},
                                  )
                                ])),
                          ])),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width - 14,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(children: [
                            const Text('16.12.2022',
                                style: TextStyle(fontSize: 20)),
                            Align(
                                alignment: Alignment.topRight,
                                child: Row(children: <Widget>[
                                  const Icon(
                                    Icons.fitness_center,
                                    color: Colors.orange,
                                    size: 24.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                  const Text(
                                      ' Jogging                                                 ',
                                      style: TextStyle(fontSize: 20)),
                                  Checkbox(
                                    checkColor: Colors.black,
                                    value: isChecked,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    onChanged: (bool? value) {},
                                  )
                                ])),
                          ]))
                    ]),
              )
            ])));
  }
}
