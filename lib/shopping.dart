import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

const br = Text('', style: TextStyle(fontSize: 20));
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
                Container(
                  height: MediaQuery.of(context).size.height*0.15,
                  color: Colors.orange,
                ),br,
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width *0.9,
                  color: Colors.white,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width*0.9,
                      lineHeight: 10.0,
                      percent: 2/4,
                      progressColor: Colors.white,
                      backgroundColor: Colors.orange,
                      barRadius: const Radius.circular(16),
                    ),Text('1 out of 4')
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
              ]),
            )
    )
    );
  }
}