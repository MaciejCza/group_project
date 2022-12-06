
import 'main.dart';
import 'app.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'workout.dart';
import 'shopping.dart';
import 'water.dart';
class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);
  @override
  State<Calendar> createState() => _CalendarState();
}
class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day,DateTime focusedDay){
    setState(() {
      today = day;
    });}
    final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      minimumSize: Size(50,50),
    );
    CalendarFormat _calendarFormat = CalendarFormat.month;
    RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
    DateTime _focusedDay = DateTime.now();
    DateTime? _selectedDay;
    DateTime? _rangeStart;
    DateTime? _rangeEnd;
  @override
  void initState(){
    super.initState();
    _selectedDay = _focusedDay;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(height: MediaQuery.of(context).size.height,
        child:
        Column(children:[
          Column(children: [
          Column(children: [
          Container(decoration: const BoxDecoration(color: Colors.orange,boxShadow:[BoxShadow(color: Colors.grey,spreadRadius: 2,blurRadius: 7,offset: Offset(0,3))]),width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.17,child:
              Column(children: [
              Container(margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),height: MediaQuery.of(context).size.height*0.07,child:
                const Image(image: AssetImage("assets/logo.png"),)
              ),
              Container(margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),child:
                const Text('BusyBeePlanner',style: TextStyle(fontSize: 24),)
              )
              ]))
          ]),
            const SizedBox(height: 20)
          ]),
          Container(padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),height: MediaQuery.of(context).size.height*0.735,child:
          SingleChildScrollView(child:
            Column(children: [
              Container(height: MediaQuery.of(context).size.height*0.03,width: MediaQuery.of(context).size.width*0.3 ,decoration: const BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.all(Radius.circular(5))),alignment: Alignment.center,child:
                Text(datowski())
              ),
              Card(
                child: TableCalendar(
                  firstDay: DateTime.utc(0,10,16),
                  lastDay: DateTime.utc(999999999999999999,3,14),
                  focusedDay: today,
                  calendarFormat: CalendarFormat.month,
                  headerVisible: false,
                  daysOfWeekHeight: 25,
                  rowHeight: 40,
                  onDaySelected: _onDaySelected,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  daysOfWeekStyle: const DaysOfWeekStyle(weekendStyle: TextStyle(color: Colors.red)),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  calendarStyle: const CalendarStyle(weekendTextStyle: TextStyle(color: Colors.orange),selectedDecoration: BoxDecoration(color: Colors.orange,shape: BoxShape.circle),todayDecoration: BoxDecoration(color: Colors.grey,shape: BoxShape.circle)),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20,),
                    decoration:BoxDecoration(color: Colors.yellow,borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
                  ),
                )
              ),
            ],
            )
          )),
          Expanded(child: Align(
          alignment: FractionalOffset.bottomCenter,
            child: Container(color: Colors.white,child:
          Row(children:[
          TextButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder:(context) => const Shopping())
            );
          },
              child: const Icon(Icons.checklist_outlined,color: Colors.orange,size: 40,)
          ),
          SizedBox(width:MediaQuery.of(context).size.width*0.042 ),
          TextButton(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => const Calendar())
              );
            },
            child: const Icon(Icons.calendar_month,color: Colors.orange,size: 40,)
          ),
          SizedBox(width:MediaQuery.of(context).size.width*0.045 ),
          TextButton(
              style: ElevatedButton.styleFrom(foregroundColor:Colors.black),
              onPressed: (){},
              child: const Icon(Icons.home,color: Colors.orange,size: 40,)
          ),
          SizedBox(width:MediaQuery.of(context).size.width*0.045 ),
          TextButton(
              style: ElevatedButton.styleFrom(foregroundColor:Colors.black),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => const Workout())
                );
              },
              child: const Icon(Icons.fitness_center,color: Colors.orange,size: 40,)
          ),
          SizedBox(width:MediaQuery.of(context).size.width*0.045 ),
          TextButton(
              style: ElevatedButton.styleFrom(foregroundColor:Colors.black),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => const water())
                );
              },
              child: const Icon(Icons.water_drop,color: Colors.orange,size: 40,)
          )
        ]))
        ))])
    )

    );
  }
}
String datowski() {
  var date = DateTime.now().toString();
  var dateParse = DateTime.parse(date);
  var formattedDate = "${dateParse.month}";
  var here;
  if(formattedDate=='12') {
    here = 'December';
  }if(formattedDate=='11'){
    here = "November";
  }if(formattedDate=='10'){
    here = "October";
  }if(formattedDate=='9'){
    here = 'September';
  }if(formattedDate=='8'){
    here = 'August';
  }if(formattedDate=='7'){
    here = 'July';
  }if(formattedDate=='6'){
    here = 'June';
  }if(formattedDate=='5'){
    here = 'May';
  }if(formattedDate=='4'){
    here = 'April';
  }if(formattedDate=='3'){
    here = 'March';
  }if(formattedDate=='2'){
    here = 'February';
  }if(formattedDate=='1'){
    here = 'January';
  }
  return here.toString();
}
