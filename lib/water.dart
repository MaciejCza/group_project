import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
        const Text('Hydrate yourself'),
            const Icon(Icons.local_drink,
            color: Colors.orange,
            size: 100),
          Text(glass.toString() + ' glass'),
             const SizedBox(height: 10),
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width*0.9,
              lineHeight: 10.0,
              percent: 1/8,
              progressColor: Colors.white,
              backgroundColor: Colors.orange,
              barRadius:  const Radius.circular(16),
            ),
            Wrap(
              children: [
                ElevatedButton(
                  onPressed: () {
                    glass-=1;
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.orange),
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.orange,
                  ),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    glass+=1;
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.orange),
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.orange,
                  ),
                  child: const Text('+'),
                ),
              ],
            )
  ]
        )
        ) ],
        )
    );
  }
}
