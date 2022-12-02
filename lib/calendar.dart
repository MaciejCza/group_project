import 'main.dart';
import 'app.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      SafeArea(child:
        Container(child:
          Container(child:
            SingleChildScrollView(child:
              Column(children: [
                Card(margin: const EdgeInsets.all(8.0),elevation: 5.0,shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)),side: BorderSide(color: Colors.black,width: 2.0),),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010,10,16),
                    lastDay: DateTime.utc(2030,3,14),
                    focusedDay: DateTime.now(),
                    calendarFormat: CalendarFormat.month,
                    daysOfWeekHeight: 40,
                    rowHeight: 60,
                  )
                ),
              ],

              )
            )
          )
      )
    ));
  }
}
