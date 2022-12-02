import 'package:flutter/material.dart';

void main() => runApp(const water());
var glass = '';
class water extends StatelessWidget {
  const water({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children:  [
            Container(decoration: const BoxDecoration(color: Colors.yellow,boxShadow:[BoxShadow(color: Colors.grey,spreadRadius: 5,blurRadius: 7,offset: Offset(0,3))]),width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.17,child:
            Column(children: [
              Container(margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),height: MediaQuery.of(context).size.height*0.07,child:
              const Image(image: AssetImage("assets/logo.png"),)
              ),
              Container(margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),child:
              const Text('BusyBee',style: TextStyle(fontSize: 24),)
              )
            ])),
            SizedBox(height: 25,),
            Text('Hydrate yourself'),
            // Image(image: image) szklanka
            Text('1 glass'),
            SizedBox(height: 10),
            LinearProgressIndicator(
                value: (0.1),
            ),
            SizedBox(height: 10),
            TextButton(
                child: Text('-'),
              onPressed: () {
                  glass+='-0.125';
              }
            ),
            TextButton(
                child: Text('+'),
                onPressed: () {
                  glass+='0.125';
                }
            ),
          ],
        )
    );
  }
}
