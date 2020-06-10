import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/schedule.dart';
import './edit_reminders.dart';

// import '../helpers/db.dart';
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
          Navigator.pushNamed(context, '/addreminders');
        },
        backgroundColor: Theme.of(context).buttonColor,
        focusColor: Colors.greenAccent,
        splashColor: Colors.greenAccent,
        tooltip: "Add a reminder",
        child: Icon(Icons.add, color: Theme.of(context).primaryColorLight),
      ),
    );
  }
}

class CustomHomeScreen extends StatefulWidget {
  @override
  _CustomHomeScreenState createState() => _CustomHomeScreenState();
}

// Center(child: Text('schedule.name'));
class _CustomHomeScreenState extends State<CustomHomeScreen> {
  Box<Schedule> scheduleBox;

  @override
  void initState() {
    scheduleBox = Hive.box<Schedule>('schedule');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: scheduleBox.listenable(),
      builder: (context, Box<Schedule> schedules, _) {
        List<int> keys = schedules.keys.cast<int>().toList();
        return ListView.builder(
            itemCount: keys.length,
            itemBuilder: (_, index) {
              final int key = keys[index];
              final Schedule schedule = schedules.get(key);
              return Card(
                  child: ListTile(
                title: Text(schedule.name),
                subtitle: Column(
                  children: <Widget>[
                    Text(schedule.dosage.toString() + ' pills'),
                    Text(schedule.drugType.toString()),
                    Text(schedule.frequency == null ? '' : schedule.frequency),
                    Text(schedule.firstTime.toString()),
                    Text(schedule.secondTime.toString()),
                    Text(schedule.thirdTime.toString()),
                    Text(schedule.startDate.toString()),
                    Text(schedule.endDate.toString()),
                  ],
                ),
                trailing: Column(children: <Widget>[
                  IconButton(onPressed: () {
                    scheduleBox.delete(key);
                  }, icon: Icon(Icons.delete)),
                  Expanded(
                    child: IconButton(onPressed: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditRemindersScreen(reminderid: key) )
                      );
                    }, icon: Icon(Icons.edit)),
                  )
                ]),
              ));
            });
      },
    );
//                   CustomScrollView(
//                     slivers: <Widget>[
//                       SliverAppBar(
//                         automaticallyImplyLeading: false,
//                         backgroundColor: Theme.of(context).primaryColor,
//                         expandedHeight: MediaQuery.of(context).size.height * .2,
//                         centerTitle: true,
//                         pinned: true,
//                         title: Text('Medications Reminder',
//                             style: Theme.of(context).textTheme.headline6.copyWith(
//                                   color: Theme.of(context).primaryColorLight,
//                                 )),
//                       ),
// SliverFillRemaining(
//   child: Text(schedule.name)
// )
//                       //Drug reminders are read from DB and rendered with SliverGrid
//                       // SliverGrid.count(
//                       //   crossAxisCount: 2,
//                       //   children: numbers.map((e) => Row(
//                       //     children: <Widget>[
//                       //       Container(
//                       //         width:50,
//                       //         height:50,
//                       //         color: Colors.green,
//                       //         child: Center(
//                       //           child:Text(
//                       //             '$e',
//                       //             style: TextStyle(
//                       //               fontSize: SizeConfig().textSize(context, 4.5)
//                       //             ),

//                       //           )
//                       //         ),
//                       //       ),
//                       //       SizedBox(width:20),
//                       //     ],
//                       //   )).toList(),
//                       //   )
//                     ],
//                   );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
