import 'main.dart';
import 'app.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(decoration: const BoxDecoration(color: Colors.black),padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),height: MediaQuery.of(context).size.height,
        child:
        Column(children:[
          Column(children: [
          Column(children: [
          Container(decoration: const BoxDecoration(color: Colors.yellow,boxShadow:[BoxShadow(color: Colors.grey,spreadRadius: 5,blurRadius: 7,offset: Offset(0,3))]),width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.17,child:
              Column(children: [
              Container(margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),height: MediaQuery.of(context).size.height*0.07,child:
                const Image(image: AssetImage("assets/logo.png"),)
              ),
              Container(margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),child:
                const Text('Bussy',style: TextStyle(fontSize: 24),)
              )
              ]))
          ])
          ]),
          Container(height: MediaQuery.of(context).size.height*0.8,decoration: const BoxDecoration(color: Colors.white),child:
          SingleChildScrollView(child:
            Column(children: [
              Card(margin: const EdgeInsets.all(8.0),elevation: 5.0,shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)),side: BorderSide(color: Colors.black,width: 2.0),),
                child: TableCalendar(
                  firstDay: DateTime.utc(2010,10,16),
                  lastDay: DateTime.utc(2030,3,14),
                  focusedDay: DateTime.now(),
                  calendarFormat: CalendarFormat.month,
                  daysOfWeekHeight: 20,
                  rowHeight: 30,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  daysOfWeekStyle: const DaysOfWeekStyle(weekendStyle: TextStyle(color: Colors.red)),
                  calendarStyle: const CalendarStyle(weekendTextStyle: TextStyle(color: Colors.orange),todayDecoration: BoxDecoration(color: Colors.yellow,shape: BoxShape.circle),selectedDecoration: BoxDecoration(color: Colors.deepOrangeAccent,shape: BoxShape.circle)),
                  headerStyle: const HeaderStyle(

                    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20,),
                    decoration: BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
                  formatButtonTextStyle: TextStyle(fontSize: 0),
                  formatButtonDecoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(0)))),

                )
              ),
            ],

            )
          ))]
    )));
  }
}
