import 'package:flutter/material.dart';
import 'package:medications_reminder_app/DB/db.dart';
import 'package:medications_reminder_app/navigation/app_navigation/navigation.dart';
import 'package:medications_reminder_app/responsiveness/size_config.dart';
import 'package:medications_reminder_app/ui/add_reminders_screen.dart';
import 'package:medications_reminder_app/ui/drugs_description_screen.dart';
import 'package:provider/provider.dart';

//Note that the colours are #fdfcff and #40b26d
//! Colours have now been included in the app_theme.dart file so you can use Theme.of(context).whatever_color you like
//I already added the google fonts package, use poppins
//I'M COUNTING ON YOU!!!
class HomeScreen extends StatelessWidget {
  final Navigation navigation = Navigation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: WillPopScope(
          //Exit application
          onWillPop: () => navigation.pop(context),
          child: CustomHomeScreen()),
      floatingActionButton: FloatingActionButton(
        //Navigate to add reminders screen
        onPressed: () {
          navigation.pushToAndReplace(context,
              RemindersScreen(buttonText: 'Add Schedule', refresh: true));
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

class _CustomHomeScreenState extends State<CustomHomeScreen> {
  void initState() {
    super.initState();
    Provider.of<DB>(context, listen: false).getSchedules();
  }

  //Instantiating SizeConfig class for responsiveness
  SizeConfig config = SizeConfig();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          expandedHeight: MediaQuery.of(context).size.height * .22,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image(
                height: config.yMargin(context, 5),
                width: config.xMargin(context, 18),
                image: AssetImage('images/medbuzz-3.png')),
            centerTitle: true,
            title: Text('My Schedules',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Theme.of(context).primaryColorLight,
                    )),
          ),
        ),

        //Drug reminders are read from DB and rendered with SliverGrid
        Consumer<DB>(
          builder: (context, db, child) {
            return SliverPadding(
              padding: EdgeInsets.fromLTRB(config.xMargin(context, 4),
                  config.yMargin(context, 3), 0, config.yMargin(context, 3.5)),
              sliver: SliverGrid.count(
                crossAxisCount: 2,
                children: db.schedules.map((e) {
                  return db.schedules.length == 0
                      ? Center(child: Text('No schedule'))
                      : Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * .45,
                              height: MediaQuery.of(context).size.width * .45,
                              child: FlatButton(
                                //Navigate to drug description screen
                                onPressed: () {
                                  Navigation().pushToAndReplace(context,
                                      DrugsDescriptionScreen(schedule: e));
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      config.xMargin(context, 6)),
                                ),
                                color: Theme.of(context).primaryColorLight,
                                splashColor: Theme.of(context).buttonColor,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      e.drugType == 'Tablet'
                                          ? shape(
                                              'images/icons8-tablets-32.png')
                                          : e.drugType == 'Capsule'
                                              ? shape(
                                                  'images/icons8-pill-32.png')
                                              : e.drugType == 'Drop'
                                                  ? shape('images/drop.png')
                                                  : e.drugType == 'Injection'
                                                      ? shape(
                                                          'images/icons8-syringe-32.png')
                                                      : SizedBox(
                                                          height:
                                                              config.yMargin(
                                                                  context, 1.5),
                                                        ),
                                      Text(
                                        e.drugName == null
                                            ? 'Set a schedule'
                                            : '${e.drugName}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: config.textSize(context, 7),
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      SizedBox(
                                        height: config.yMargin(context, 2),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                             db.scheduleDescription(e),
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: config.textSize(
                                                    context, 3.8),
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey[400],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        );
                }).toList(),
              ),
            );
          },
        ),
      ],
    );
  }

  shape(String path) {
    return Image(
      image: AssetImage(path),
      color: Theme.of(context).primaryColor,
    );
  }
}
