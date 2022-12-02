import 'main.dart';
import 'app.dart';
import 'package:flutter/material.dart';

class Workout extends StatelessWidget {
  const Workout({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(color: Colors.yellow),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: const Text(
                          'Hello World',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: LinearProgressIndicator(
                              value: 0.7,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff00ff00)),
                              backgroundColor: Color(0xffD6D6D6),
                            ),
                          ))
                    ]))));
  }
}
