import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'shopping.dart';
import 'calendar.dart';
import 'workout.dart';
void main() => runApp(const water());
num glass = 0;
class water extends StatefulWidget {
  const water({super.key});

  @override
  State<water> createState() => _waterState();
}

class _waterState extends State<water> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children:  [
            Container(decoration: const BoxDecoration(color: Colors.orange,
                boxShadow:[BoxShadow(color: Colors.grey,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0,3))]),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.17,
                child:
            Column(children: [
              Container(margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  height: MediaQuery.of(context).size.height*0.07,
                  child:
              const Image(image: AssetImage("assets/logo.png"),)
              ),
              Container(margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child:
              const Text('BusyBeePlanner',style: TextStyle(fontSize: 24),)
              )
            ])),
             SizedBox(height: MediaQuery.of(context).size.height * 0.225),
        Container(
          color: Colors.white,
          child: Column( children: <Widget> [
            const SizedBox(height: 15),
        const Text('Hydrate yourself'),
            const SizedBox(height: 15),
            const Icon(Icons.local_drink,
            color: Colors.orange,
            size: 120),
          const SizedBox(height: 15),
          Text('$glass glass'),
             const SizedBox(height: 15),
            Container(
              height: MediaQuery.of(context).size.height*0.03,
                child: LiquidLinearProgressIndicator(
                  value: glass/8,
                  valueColor: AlwaysStoppedAnimation(Colors.yellow),
                  backgroundColor: Colors.white,
                  borderColor: Colors.orangeAccent,
                  borderWidth: 2.0,
                  borderRadius: 12.0,
                  direction: Axis.horizontal,
                  center: Text(''),
                )
            ),
            const SizedBox(height: 15),
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

  ]
        )

        ),
       ],

        )

    );
  }
}
