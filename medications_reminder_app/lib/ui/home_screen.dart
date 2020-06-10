import 'package:flutter/material.dart';
import '../DB/db.dart';
import '../model/schedule_model.dart';
import '../responsiveness/size_config.dart';

//Note that the colours are #fdfcff and #40b26d
//! Colours have now been included in the app_theme.dart file so you can use Theme.of(context).whatever_color you like
//I already added the google fonts package, use poppins
//I'M COUNTING ON YOU!!!
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomHomeScreen(),
      floatingActionButton: FloatingActionButton(
        //Navigate to add reminders screen
        onPressed: () {
         final sampleSchedule = Schedule()
                ..name = "test"
                ..endAt = new DateTime.now()
                ..time = new DateTime.now()
                ..startAt = new DateTime.now()
                ..frequency = 2
                ..duration = 2
                ..drugType = "test";

          dataHolder().addSchedule(sampleSchedule);

          Navigator.pushNamed(context, '/drugsdescription');

        },
        backgroundColor: Theme.of(context).buttonColor,
        focusColor: Colors.greenAccent,
        splashColor: Colors.greenAccent,
        tooltip: "Add a reminder",
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColorLight
        ),
      ),
    );
  }
}

class CustomHomeScreen extends StatefulWidget {
  @override
  _CustomHomeScreenState createState() => _CustomHomeScreenState();
}

class _CustomHomeScreenState extends State<CustomHomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Schedule> _scheduleContent;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          expandedHeight: MediaQuery.of(context).size.height * .2,
          centerTitle: true,
          pinned: true,
          title: Text(
            'Medications Reminder',
            style: Theme.of(context).textTheme.headline6.copyWith(color:Theme.of(context).primaryColorLight,)
          ),
        ),
//        SliverGrid(
//          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 2,
//            childAspectRatio: 0.8,
//          ),
//          delegate: SliverChildBuilderDelegate(
//                (context,index) {
//                  return(
//                  Container(
//                    width: 50,
//                    height: 50,
//                  )
//                  );
//             },
//            childCount: DB().scheduleLength
//          ),
//        ),
        //Drug reminders are read from DB and rendered with SliverGrid
         SliverGrid(
           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
               maxCrossAxisExtent: 200,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
           delegate: SliverChildBuilderDelegate((context,index){
             Schedule _scheduleData = dataHolder().getschedule(index);
             var name = _scheduleData.name;
             return Container (
               width:50,
               height:50,
               color: Colors.green,
                 child:Text(
                 '$name',
                 style: TextStyle(
                 fontSize: SizeConfig().textSize(context, 4.5)
             )
             )
             );
           }),
           )
      ],
    );
  }





}




