import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

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
double bar = 0;
int progress = 0;
class _ShoppingState extends State<Shopping> {

  showAlertDialog(BuildContext context){
    Widget okButton = TextButton(
      onPressed: () { },
      style: TextButton.styleFrom(backgroundColor: Colors.orange),
      child: const Text("OK", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
    );
    Widget cancelButton = TextButton(
      onPressed: () => Navigator.pop(context),
      style: TextButton.styleFrom(backgroundColor: Colors.orange),
      child: const Text("Cancel", style: TextStyle(color: Colors.black))
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Add new item", style: TextStyle(color: Colors.orangeAccent)),
      content: const TextField(),
      actions: [
        cancelButton,
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAlertDialog(context);
          },
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
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width *0.9,
                  child: LiquidLinearProgressIndicator(
                    value: bar,
                    valueColor: const AlwaysStoppedAnimation(Colors.orange),
                    backgroundColor: Colors.white,
                    borderColor: Colors.orangeAccent,
                    borderWidth: 2.0,
                    borderRadius: 12.0,
                    direction: Axis.horizontal,
                    center: Text('$progress out of 4'),
                  ),),br,
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
                          if(checkedIs == false){
                            bar = bar + 1/4;
                            progress = progress +1;
                          }
                          else {
                            bar = bar - 1/4;
                            progress = progress - 1;
                          }
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
                          if(isChecked == false){
                            bar = bar + 1/4;
                            progress = progress + 1;
                          }
                          else {
                            bar = bar - 1/4;
                            progress = progress - 1;
                          }
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
                          if(checked == false){
                            bar = bar + 1/4;
                            progress = progress + 1;
                          }
                          else {
                            bar = bar - 1/4;
                            progress = progress - 1;
                          }
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
                        if(onChecked == false){
                          bar = bar + 1/4;
                          progress = progress + 1;
                        }
                        else {
                          bar = bar - 1/4;
                          progress = progress - 1;
                        }
                        setState(() {
                          onChecked = !onChecked;
                        });
                      },
                    ),
                  ],),),br,
                // Container( child: CircleAvatar(
                //   backgroundColor: Colors.orange,
                //   child: IconButton(
                //     color: Colors.white,
                //     onPressed: () {},
                //     icon: Icon(Icons.add),
                //   ),
                // ),),
    ])
    )),);
  }
}