import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

const br = Text('', style: TextStyle(fontSize: 20));
const sbr = Text('', style: TextStyle(fontSize: 10));
bool checked = false;
class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  State<Shopping> createState() => _ShoppingState();
}
class _ShoppingState extends State<Shopping> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[100],
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Container(decoration: const BoxDecoration(color: Colors.yellow,boxShadow:[BoxShadow(color: Colors.grey,spreadRadius: 5,blurRadius: 7,offset: Offset(0,3))]),width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.17,child:
                Column(children: [
                  Container(margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),height: MediaQuery.of(context).size.height*0.07,child:
                  const Image(image: AssetImage("assets/logo.png"),)
                  ),
                  Container(margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),child:
                  const Text('Bussy',style: TextStyle(fontSize: 24),)
                  )
                ])),br,
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width *0.9,
                  color: Colors.white,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width*0.9,
                      lineHeight: 10.0,
                      percent: 1/4,
                      progressColor: Colors.white,
                      backgroundColor: Colors.orange,
                      barRadius: const Radius.circular(16),
                    ),sbr,Text('1 out of 4')
                  ],),),br,
                Container(
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.width *0.9,
                  color: Colors.white,
                  child: Column(children: [
                    CheckboxListTile(
                      title: Text('Buy jacket'),
                      checkColor: Colors.orange,
                      value: checked,
                      onChanged: (bool? value) {},
                    ),
                  ],),),br,
                Container(
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.width *0.9,
                  color: Colors.white,
                  child: Column(children: [
                    CheckboxListTile(
                      title: Text('Buy jacket'),
                      checkColor: Colors.orange,
                      value: checked,
                      onChanged: (bool? value) {},
                    ),
                  ],),),br,
                Container(
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.width *0.9,
                  color: Colors.white,
                  child: Column(children: [
                    CheckboxListTile(
                      title: Text('Buy jacket'),
                      checkColor: Colors.orange,
                      value: checked,
                      onChanged: (bool? value) {},
                    ),
                  ],),),br,
                Container(
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.width *0.9,
                  color: Colors.white,
                  child: Column(children: [
                    CheckboxListTile(
                      title: Text('Buy jacket'),
                      checkColor: Colors.orange,
                      value: checked,
                      onChanged: (bool? value) {},
                    ),
                  ],),)
    ])
    )));
  }
}