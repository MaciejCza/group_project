import 'package:flutter/material.dart';
import 'main.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BusyBeePlaner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const (title: 'Tomasz Mrozek'),
    );
  }
}