import 'package:flutter/material.dart';


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
        onPressed: () {},
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

        //Drug reminders are read from DB and rendered with SliverGrid
        // SliverGrid.count(
        //   crossAxisCount: 2,
        //   children: numbers.map((e) => Row(
        //     children: <Widget>[
        //       Container(
        //         width:50,
        //         height:50,
        //         color: Colors.green,
        //         child: Center(
        //           child:Text(
        //             '$e',
        //             style: TextStyle(
        //               fontSize: SizeConfig().textSize(context, 4.5)
        //             ),
                    
        //           )
        //         ),
        //       ),
        //       SizedBox(width:20),
        //     ],
        //   )).toList(),
        //   )
      ],
    );
  }
}