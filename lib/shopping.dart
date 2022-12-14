import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

const br = Text('', style: TextStyle(fontSize: 10));
class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  State<Shopping> createState() => _ShoppingState();
}

double bar = 0;
int progress = 0;
class _ShoppingState extends State<Shopping> {

  final testing = TextEditingController();
  @override
  void dispose() {
    testing.dispose();
    super.dispose();
  }

  showAlertDialog(BuildContext context){
    Widget okButton = TextButton(
      onPressed: () {
        titles.add(testing.text);
        Navigator.pop(context);
        testing.clear();
      },
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
      content: TextField(
        controller: testing,
      ),
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
  List<String> titles = ["Program checkboxes", "Buy a jacket","Test"];
  List<bool> checked = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    value: bar/titles.length,
                    valueColor: const AlwaysStoppedAnimation(Colors.orange),
                    backgroundColor: Colors.white,
                    borderColor: Colors.orangeAccent,
                    borderWidth: 2.0,
                    borderRadius: 12.0,
                    direction: Axis.horizontal,
                    center: Text('$progress out of ${titles.length}'),
                  ),),br,
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width ,
                  child: ListView.builder(
                      itemCount: titles.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: CheckboxListTile(
                            title: Text(titles[index], style: TextStyle(decoration: checked[index]== true ? TextDecoration.lineThrough : TextDecoration.none)),
                            activeColor: Colors.orange,
                            value: checked[index],
                            onChanged: (value) {
                              setState(() {
                                if(checked[index] == false){
                                  bar = bar + 1;
                                  progress = progress + 1;
                                }
                                else {
                                  bar = bar - 1;
                                  progress = progress - 1;
                                }
                                checked[index] = !checked[index];
                              });
                            },
                          ),
                        );
                      }
                  ),
                )
    ])
    )),);
  }
}