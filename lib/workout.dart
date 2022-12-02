import 'main.dart';
import 'app.dart';
import 'package:flutter/material.dart';

class Workout extends StatelessWidget {
  const Workout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('AppBar Demo')),
        body: Container(child: Container(child: Text('Hello World'))));
  }
}
