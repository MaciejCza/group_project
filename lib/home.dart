import 'package:busy_bee_planner/shopping.dart';
import 'package:busy_bee_planner/water.dart';
import 'package:busy_bee_planner/workout.dart';
import 'package:flutter/material.dart';

import 'calendar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    const Shopping(),
    const Calendar(),
    const MainPage(), //USUŃ LOGO Z STRONY GŁÓWNEJ
    const Workout(),
    const water()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: screens.elementAt(currentIndex),
        ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.yellow,
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