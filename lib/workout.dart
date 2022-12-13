import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:flutter/material.dart';

bool checkedValue = false;
bool checkedValue1 = false;
bool checkedValue2 = false;
bool checkedValue3 = false;
double workouts = 0;
int workoutst = workouts.toInt();
final _topicController = TextEditingController();
final _messageController = TextEditingController();
String workstr = workoutst.toString();
String name1 = "";
double iconSize = 0;
double checkSize1 = 0;
double checkSize2 = 0;
double checkSize3 = 0;
double checkSize = 0;
int firstsize = 1;
int secondsize = 0;
int adding = 0;
var date1 = const Text('');
double size1 = 0;
var title1 = const Text('');
var check1 = const Text('');
bool col = false;

const Color kColor = Colors.orange;

class Workout extends StatefulWidget {
  const Workout({Key? key}) : super(key: key);

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  late final Color customColor;
  final controler = TextEditingController();
  @override
  void dispose() {
    controler.dispose();
    super.dispose();
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        adding = adding + 1;
        setState(() {
          if (adding == 1) {
            firstsize = 0;
            secondsize = 1;
            String name1 = _messageController.text;
            date1 = const Text('Today workout', style: TextStyle(fontSize: 20));
            title1 =
                Text('  ${controler.text}', style: TextStyle(fontSize: 20));
            iconSize = 24;
            checkSize = 1;
          } else if (adding == 2) {
            checkSize1 = 1;
          } else if (adding == 3) {
            checkSize2 = 1;
          } else if (adding == 4) {
            checkSize3 = 1;
          }
        });
      },
    );
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () => Navigator.pop(context),
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Add new workout"),
      content: TextField(
        controller: controler,
      ),
      actions: [
        cancelButton,
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
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
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05 +
                              secondsize),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width - 14,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                              child: const Text('Weekly workout progress',
                                  style: TextStyle(fontSize: 20)),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.016,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: LiquidLinearProgressIndicator(
                                value: workouts / 4,
                                valueColor:
                                    const AlwaysStoppedAnimation(Colors.orange),
                                backgroundColor: Colors.white,
                                borderColor: Colors.orangeAccent,
                                borderWidth: 2.0,
                                borderRadius: 12.0,
                                direction: Axis.horizontal,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.012,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.024,
                                child: Text('$workstr out of 4 workouts',
                                    style: const TextStyle(fontSize: 10))),
                          ])),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.45 *
                            firstsize,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height *
                              0.1 *
                              checkSize,
                          width: MediaQuery.of(context).size.width -
                              14 * checkSize,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(children: [
                            Row(children: [date1]),
                            // alignment: Alignment.topRight,
                            Row(children: [
                              Icon(
                                Icons.fitness_center,
                                color: kColor,
                                size: iconSize,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              ),
                              title1,
                              const Expanded(child: SizedBox()),
                              Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: Colors.orange),
                                  child: Checkbox(
                                    checkColor: Colors.orange,
                                    value: checkedValue,
                                    activeColor: Colors.orange,
                                    onChanged: (newValue) {
                                      setState(() {
                                        if (checkedValue == false) {
                                          checkedValue = true;
                                          workouts = workouts + 1;
                                          workoutst = workouts.toInt();
                                          workstr = workoutst.toString();
                                        } else {
                                          checkedValue = false;

                                          workouts = workouts - 1;
                                          workoutst = workouts.toInt();
                                          workstr = workoutst.toString();
                                        }
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  )),
                            ]),
                          ])),
                      SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.3 *
                              (checkSize - checkSize1)),
                      Container(
                          height: MediaQuery.of(context).size.height *
                              0.1 *
                              checkSize1,
                          width: MediaQuery.of(context).size.width -
                              14 * checkSize1,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(children: [
                            Row(children: const [
                              Text('12.12.22', style: TextStyle(fontSize: 20)),
                            ]),
                            Row(children: <Widget>[
                              const Icon(
                                Icons.fitness_center,
                                color: Colors.orange,
                                size: 24.0,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              ),
                              Text('  ${controler.text}',
                                  style: TextStyle(fontSize: 20)),
                              const Expanded(child: SizedBox()),
                              Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: Colors.orange),
                                  child: Checkbox(
                                    checkColor: Colors.orange,
                                    value: checkedValue1,
                                    activeColor: Colors.orange,
                                    onChanged: (newValue) {
                                      setState(() {
                                        if (checkedValue1 == false) {
                                          checkedValue1 = true;
                                          workouts = workouts + 1;
                                          workoutst = workouts.toInt();
                                          workstr = workoutst.toString();
                                        } else {
                                          checkedValue1 = false;

                                          workouts = workouts - 1;
                                          workoutst = workouts.toInt();
                                          workstr = workoutst.toString();
                                        }
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ))
                            ]),
                          ])),
                      Container(
                          height: MediaQuery.of(context).size.height *
                              0.1 *
                              checkSize2,
                          width: MediaQuery.of(context).size.width -
                              14 * checkSize2,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(children: [
                            Row(children: const [
                              Text('14.12.22', style: TextStyle(fontSize: 20)),
                            ]),
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
                                  const Text(' Full body workout',
                                      style: TextStyle(fontSize: 20)),
                                  const Expanded(child: SizedBox()),
                                  Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor: Colors.orange),
                                      child: Checkbox(
                                        checkColor: Colors.orange,
                                        value: checkedValue2,
                                        activeColor: Colors.orange,
                                        onChanged: (newValue) {
                                          setState(() {
                                            if (checkedValue2 == false) {
                                              checkedValue2 = true;
                                              workouts = workouts + 1;
                                              workoutst = workouts.toInt();
                                              workstr = workoutst.toString();
                                            } else {
                                              checkedValue2 = false;

                                              workouts = workouts - 1;
                                              workoutst = workouts.toInt();
                                              workstr = workoutst.toString();
                                            }
                                          });
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ))
                                ])),
                          ])),
                      Container(
                          height: MediaQuery.of(context).size.height *
                              0.1 *
                              checkSize3,
                          width: MediaQuery.of(context).size.width -
                              14 * checkSize3,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(children: [
                            Row(children: const [
                              Text('16.12.22', style: TextStyle(fontSize: 20)),
                            ]),
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
                                  const Text(' Jogging',
                                      style: TextStyle(fontSize: 20)),
                                  const Expanded(child: SizedBox()),
                                  Theme(
                                      data: ThemeData(
                                          unselectedWidgetColor: Colors.orange),
                                      child: Checkbox(
                                        checkColor: Colors.orange,
                                        value: checkedValue3,
                                        activeColor: Colors.orange,
                                        onChanged: (newValue) {
                                          setState(() {
                                            if (checkedValue3 == false) {
                                              checkedValue3 = true;

                                              workouts = workouts + 1;
                                              workoutst = workouts.toInt();
                                              workstr = workoutst.toString();
                                            } else {
                                              checkedValue3 = false;

                                              workouts = workouts - 1;
                                              workoutst = workouts.toInt();
                                              workstr = workoutst.toString();
                                            }
                                          });
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ))
                                ])),
                          ]))
                    ]),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            ])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog(context);
        },
        backgroundColor: Colors.orangeAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
