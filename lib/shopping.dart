import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

const br = Text('', style: TextStyle(fontSize: 10));
class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  State<Shopping> createState() => _ShoppingState();
}
bool isChecked = false;
bool checkedIs = false;
bool checked = false;
bool onChecked = false;
class _ShoppingState extends State<Shopping> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.orangeAccent,
          child: const Icon(Icons.add),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[100],
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Container(decoration: const BoxDecoration(color: Colors.orange,boxShadow:[BoxShadow(color: Colors.grey,spreadRadius: 2,blurRadius: 7,offset: Offset(0,3))]),width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.17,child:
                Column(children: [
                  Container(margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),height: MediaQuery.of(context).size.height*0.07,child:
                  const Image(image: AssetImage("assets/logo.png"),)
                  ),
                  Container(margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),child:
                  const Text('BusyBeePlanner',style: TextStyle(fontSize: 24),)
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
                    ),br, const Text('1 out of 4')
                  ],),),br,
                Container(
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.width *0.9,
                  color: Colors.white,
                  child: Column(children: [
                    CheckboxListTile(
                      title: Text('Buy jacket', style: TextStyle(decoration: checkedIs== true ? TextDecoration.lineThrough : TextDecoration.none)),
                      activeColor: Colors.orange,
                      value: checkedIs,
                      onChanged: (value) {
                        setState(() {
                          checkedIs = !checkedIs;
                        });
                      },
                    ),
                  ],),),br,
                Container(
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.width *0.9,
                  color: Colors.white,
                  child: Column(children: [
                    CheckboxListTile(
                      title: Text('Program checkboxes', style: TextStyle(decoration: isChecked== true ? TextDecoration.lineThrough : TextDecoration.none)),
                      activeColor: Colors.orange,
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                    ),
                  ],),),br,
                Container(
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.width *0.9,
                  color: Colors.white,
                  child: Column(children: [
                    CheckboxListTile(
                      title: Text('Program button', style: TextStyle(decoration: checked== true ? TextDecoration.lineThrough : TextDecoration.none)),
                      activeColor: Colors.orange,
                      value: checked,
                      onChanged: (value) {
                        setState(() {
                          checked = !checked;
                        });
                      },
                    ),
                  ],),),br,
                Container(
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.width *0.9,
                  color: Colors.white,
                  child: Column(children: [
                    CheckboxListTile(
                      title: Text('Make everything work together', style: TextStyle(decoration: onChecked== true ? TextDecoration.lineThrough : TextDecoration.none)),
                      activeColor: Colors.orange,
                      value: onChecked,
                      onChanged: (value) {
                        setState(() {
                          onChecked = !onChecked;
                        });
                      },
                    ),
                  ],),)
    ])
    )));
  }
}