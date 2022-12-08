import 'package:busy_bee_planner/shopping.dart';
import 'package:busy_bee_planner/water.dart';
import 'package:busy_bee_planner/workout.dart';
import 'package:flutter/material.dart';
import 'calendar.dart';
import 'homepage.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

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
        )
      ])),
      Container(child: Text('Home'),)
    ],)
    );
  }
}
