import 'package:busy_bee_planner/calendar.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'main.dart';
import 'calendar.dart';
import 'shopping.dart';
import 'home.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BusyBeePlaner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Navig(),
    );
  }
}