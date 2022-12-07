import 'package:busy_bee_planner/shopping.dart';
import 'package:busy_bee_planner/water.dart';
import 'package:busy_bee_planner/workout.dart';
import 'calendar.dart';
import 'main.dart';
import 'app.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

int currentIndex = 0;
final screens = [
Shopping(),
Calendar(),
MainPage(),     //USUŃ LOGO Z STRONY GŁÓWNEJ
Workout(),
water()
];

@override
Widget build(BuildContext context) {
  return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
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
  items: [
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