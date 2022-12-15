import 'package:busy_bee_planner/shopping.dart';
import 'package:busy_bee_planner/water.dart';
import 'package:busy_bee_planner/workout.dart';
import 'package:flutter/material.dart';
import 'calendar.dart';
import 'homepage.dart';

class Navig extends StatefulWidget {
  const Navig({Key? key}) : super(key: key);

  @override
  State<Navig> createState() => _MainPageState();
}

class _MainPageState extends State<Navig> {
  int currentIndex = 0;
  final screens = [
    const MainPage(),
    const Shopping(),
    const Calendar(),
    const Workout(),
    const water()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Container(
          child: screens.elementAt(currentIndex)
        ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          iconSize: 30,
          //backgroundColor: Colors.kolor,
          //selectedItemColor: Colors.kolor,
          //selectedFontSize: numer,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              label: 'Shopping',
              icon: Icon(Icons.checklist_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Calendar',
              icon: Icon(Icons.calendar_today_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Home Page',
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Workout',
              icon: Icon(Icons.fitness_center),
            ),
            BottomNavigationBarItem(
              label: 'Water',
              icon: Icon(Icons.water_drop),
            ),
          ]),
    );
  }
}