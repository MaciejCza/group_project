import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'events.dart';
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
  late Map<DateTime,List<Event>> selectedEvents;
  final TextEditingController _eventController = TextEditingController();
  @override
  void initState(){
    selectedEvents = {};
    super.initState();
  }
  List<Event> _getEventsFromDay(DateTime date){
    return selectedEvents[date]??[];
  }
  @override
  void dispose(){
    _eventController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body:
    Container(height: MediaQuery.of(context).size.height,
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
          Container(padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),height: MediaQuery.of(context).size.height*0.345,child:
          Container(child:
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
                  eventLoader: _getEventsFromDay,
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
          )
          ),
          SingleChildScrollView(child:Column(children:[
            ..._getEventsFromDay(today).map((Event event) =>
                Column(children: [
                const SizedBox(height: 2),
                Row(children:[
              Container(width: MediaQuery.of(context).size.width*0.03,child:ListTile(
                  title: Text(event.title,maxLines: 1,style: const TextStyle(fontSize: 15)), //date
                  tileColor:  Colors.orange
              )),
              Container(width:MediaQuery.of(context).size.width*0.85 ,child:ListTile(
                  tileColor: Colors.white,
                  title:Text(event.title ,maxLines: 1,style: const TextStyle(fontSize: 15)) ))])])
          )])
          )])
    ),
        floatingActionButton: FloatingActionButton.extended(onPressed:() => showDialog(
        context: context,
        builder:(context)=>AlertDialog(
          title: const Text('add Event',style: TextStyle(color: Colors.orange),),
          content:
            TextFormField(controller: _eventController,maxLength: 40),
          actions: [
            Row(children:[
              const SizedBox(width: 125),
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(foregroundColor: Colors.black,backgroundColor: Colors.orange ),
                child:const Text('cancel'),
              ),
            const SizedBox(width: 15),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.black,backgroundColor: Colors.orange),
              child:const Text('ok'),
              onPressed: () {
                if(_eventController.text.isEmpty){

                }else{
                  if(selectedEvents[today] != null){
                    selectedEvents[today]?.add(Event(title: _eventController.text));
                  }else {
                    selectedEvents[today] = [
                      Event(title: _eventController.text)
                    ];
                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState(() {

                  });
                }
                return;
              },
            ),

            ])],)), label: const Text('add event'),icon: const Icon(Icons.add)),
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