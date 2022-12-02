import 'package:flutter/material.dart';

class Shopping extends StatelessWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
            child: Row(
              children: [
              LinearProgressIndicator(
              backgroundColor: Colors.orangeAccent,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              minHeight: 25
              )
              ],
            )
    )
    );
  }
}