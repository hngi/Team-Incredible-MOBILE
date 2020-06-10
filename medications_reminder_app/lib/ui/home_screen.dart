import 'package:flutter/material.dart';
import 'package:medications_reminder_app/DB/db.dart';
import 'package:medications_reminder_app/model/schedule_model.dart';
import 'package:medications_reminder_app/navigation/app_navigation/navigation.dart';
import 'package:medications_reminder_app/responsiveness/size_config.dart';
import 'package:medications_reminder_app/ui/add_reminders_screen.dart';


//Note that the colours are #fdfcff and #40b26d
//! Colours have now been included in the app_theme.dart file so you can use Theme.of(context).whatever_color you like
//I already added the google fonts package, use poppins
//I'M COUNTING ON YOU!!!
class HomeScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomHomeScreen(),
      floatingActionButton: FloatingActionButton(
        //Navigate to add reminders screen
        onPressed: () {
          Navigation().pushTo(context, RemindersScreen());
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
   
    //Instantiating SizeConfig class for responsiveness
    SizeConfig config = SizeConfig();

     //Instantiating a DB object to read data to DB
  DB db = DB();
  @override
  Widget build(BuildContext context) {
  
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColorDark,
          expandedHeight: MediaQuery.of(context).size.height * .2,
          floating: false,
          pinned:true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image(
              image: AssetImage('assets/medbuzz_icon-1.png')
            ),
            centerTitle: true,
            title: Text(
            'My Schedules',
            style: Theme.of(context).textTheme.headline6.copyWith(color:Theme.of(context).primaryColorLight,)
          ),
          ),
          
          
        ),

        //Drug reminders are read from DB and rendered with SliverGrid
        // SliverPadding(
        //   padding: EdgeInsets.fromLTRB(config.xMargin(context, 4), config.yMargin(context, 3.5), 0, config.yMargin(context, 3.5)),
        //   sliver: SliverGrid.count(
        //     crossAxisCount: 2,
        //     children: schedules.map((e) => Row(
        //       children: <Widget>[
        //         Container(
        //               width:MediaQuery.of(context).size.width * .45,
        //               height:MediaQuery.of(context).size.width * .45,
        //               child: FlatButton(
        //                 //Navigate to drug description screen
        //                 onPressed: (){},
        //                 shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(config.xMargin(context, 6)),
        //                 ),
        //                 color: Theme.of(context).primaryColorLight,
        //                 splashColor: Theme.of(context).buttonColor,
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children:[
        //                     e.drugType == 'Tablet' ? shape('assets/tablet.png') :  e.drugType == 'Capsule' ? shape('assets/capsule.png') :
        //                      e.drugType == 'Drops' ? shape('assets/drop.png') :  e.drugType == 'Injection' ? shape('assets/syringe.png') :
        //                   SizedBox(height: config.yMargin(context, 1),),
        //                     Text(
        //                     '${e.drugName}',
        //                     style: TextStyle(
        //                       fontSize: config.textSize(context, 5),
        //                       fontWeight: FontWeight.w600,
        //                       color: Theme.of(context).primaryColor
        //                     ),
                            
        //                   ),
        //                   SizedBox(height: config.yMargin(context, 2),),
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: <Widget>[
        //                       Text(
        //                         '${e.dosage} ${e.drugType.toLowerCase()} ${e.frequency} daily',
        //                         style: TextStyle(
        //                       fontSize: config.textSize(context, 3),
        //                       fontWeight: FontWeight.w600,
        //                       color: Colors.grey[400]
        //                     ),
        //                       )
        //                     ],
        //                   ),
        //                   ]
        //                 ),
        //               ),
        //             ),
        //       ],
        //     )).toList(),
        //     ),
        // ),
        
      ],
    );
  }

  shape(String path){
    return Image(
      image: AssetImage(path),
      color: Theme.of(context).primaryColor,
    );
  }

}
