import 'package:busy_bee_planner/shopping.dart';
import 'package:busy_bee_planner/water.dart';
import 'package:busy_bee_planner/workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState(); //kalenrarz overflow napraw
}

class _MainPageState extends State<MainPage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day,DateTime focusedDay){
    setState(() {
      today = day;
    });}

  @override
  Widget build(BuildContext context) {
    return Container(child:
    Column(children: [
      Container(decoration: const BoxDecoration(color: Colors.orange,boxShadow:[BoxShadow(color: Colors.grey,spreadRadius: 5,blurRadius: 7,offset: Offset(0,3))]),width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.17,child:
      Column(children: [
        Container(margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),height: MediaQuery.of(context).size.height*0.07,child:
        const Image(image: AssetImage("assets/logo.png"),)
        ),
        Container(margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),child:
        const Text('BusyBeePlanner',style: TextStyle(fontSize: 24),)
        ),
      ])),br,
      Container(child: CalendarWeek(
    controller: CalendarWeekController(),
    height: 100,
    minDate: DateTime.now().add(
    Duration(days: -365),
    ),
    maxDate: DateTime.now().add(
    Duration(days: 365),
    ))),
      Container(
        //praca tomka tu <----------------------------------------------------------------------
      ),
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
    style: const TextStyle(fontSize: 10)))
    ])),
    Container(
    height: MediaQuery.of(context).size.height * 0.1 * checkSize,
    width: MediaQuery.of(context).size.width - 14 * checkSize,
    decoration: const BoxDecoration(color: Colors.white),
    child: Column(children: [
    Row(children: const [
    Text('Today workout',
    style: TextStyle(fontSize: 20)),
    ]),
    // alignment: Alignment.topRight,
    Row(

    children: [
    const Icon(
    Icons.fitness_center,
    color: Colors.orange,
    size: 24.0,
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
    ],)
    ],)
    ),
      Container(child:
      Column(children: [const Text('Hydrate yourself',
          style:TextStyle(fontSize: 20)),
        Container(child:
        Row(children:[
          const Icon(Icons.local_drink,
              color: Colors.orange,
              size: 30),
          const Spacer(),
          Text('$glass glass',
          style:const TextStyle(fontSize: 20)),
          const Spacer(),
          Wrap(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    glass-=1;
                    if (glass < 0) {
                      glass+=1;
                    }
                  });
                },
                style: TextButton.styleFrom(
                  side: const BorderSide(color: Colors.orange),
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.orange,
                ),
                child: const Text('-'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    glass+=1;
                    if (glass > 8) {
                      glass-=1;
                    }
                  });
                },
                style: TextButton.styleFrom(
                  side: const BorderSide(color: Colors.orange),
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.orange,
                ),
                child: const Text('+'),
              ),
            ],
          ),
        ]))],),
      )
    ],)
    );
  }
}
