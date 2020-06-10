import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:medications_reminder_app/app_theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../DB/db.dart';
import '../DB/db.dart';
import '../app_theme/app_theme.dart';
import '../model/schedule_model.dart';
import '../model/schedule_model.dart';
import '../model/schedule_model.dart';
import '../model/schedule_model.dart';

//Note that the colours are #fdfcff and #40b26d for button
//! Colours have now been included in the app_theme.dart file so you can use Theme.of(context).whatever_color you like
//I already added the google fonts package, use poppins
//I'M COUNTING ON YOU!!!
class DrugsDescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DrugsDescription());
  }
}

class DrugsDescription extends StatefulWidget {
  final Schedule currentSchedule;

  const DrugsDescription({@required this.currentSchedule});
  @override
  _DrugsDescriptionState createState() => _DrugsDescriptionState();
}

class _DrugsDescriptionState extends State<DrugsDescription> {


  void _editSchedule(contest) {
//update logic
  }


  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _programController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: appThemeLight.primaryColorLight,
        body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            Container(
                   margin: EdgeInsets.only(top: 50, left: 35),
              child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
    },
                  icon: Icon(
                   Icons.arrow_back,
                   size: 50,
            color: Colors.black38,
             ),
          ),
      ),
              Container(
                 margin: EdgeInsets.only(top: 50, left: 10),
                   child: Row(
                     children: <Widget>[
                       Image.asset(
                     'images/tablet.png',
                     height: 110,
         ),
                    SizedBox(width: 20),

                              Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
         Text(
              'Drug name',
               style: TextStyle(color: Color(0xff808080)),
            ),
            TextField(
              autofocus: true,
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Drug Name here',
              ),
                 ),
       SizedBox(
                height: 30,
               ),
             Text(
                'Dosage',
                 style: TextStyle(color: Color(0xff808080)),
               ),
              TextField(
                autofocus: true,
                controller: _dosageController,
                decoration: InputDecoration(
                  hintText: 'Drug dosage here',
                ),
                 ),
        SizedBox(
              height: 30,
             ),
              Text(
              'Time',
               style: TextStyle(color: Color(0xff808080)),
             ),
              Text(
                   '3 pm',
                     style: TextStyle(
                     fontSize: 20,
                     color: appThemeLight.buttonColor,
                     fontWeight: FontWeight.bold),
                  ),
                 ],
               )
             ],
           ),
         ),
           SizedBox(
           height: 30,
    ),
    Container(
              margin: EdgeInsets.only(top: 50, left: 35),
    child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Text(
                  'Dose',
                    style: TextStyle(
                     color: Color(0xff000000),
                     fontWeight: FontWeight.bold,
                     fontSize: 18),
                    ),
                  SizedBox(
                  height: 10,
                 ),
             Row(
                children: <Widget>[
                Text(
                     '3 times',
                      style: TextStyle(
                      fontSize: 20,
                       color: Color(0xff808080),
                   ),
                  ),
              SizedBox(
                 width: 20,
                    ),
             TextField(
               autofocus: true,
               controller: _dosageController,
               decoration: InputDecoration(
               hintText: 'Drug dosage here'
             )
             ),
                  SizedBox(
                      width: 5,
                     ),
                       ],
                     ),
               SizedBox(
              height: 30,
                   ),
                   Text(
                       'Program',
                          style: TextStyle(
                         color: Color(0xff000000),
                         fontWeight: FontWeight.bold,
                        fontSize: 18),
                       ),
              SizedBox(
                       height: 10,
                       ),
            Row(
              children: <Widget>[
                   TextField(
                     autofocus: true,
                     controller: _programController,
                     decoration: InputDecoration(
                     hintText: 'Drug program here',
                  )
                   ),
               SizedBox(
                    width: 20,
                    ),
                  ],
                 ),
    SizedBox(
              height: 30,
           ),
     Text(
           'Quantity',
             style: TextStyle(
             color: Color(0xff000000),
             fontWeight: FontWeight.bold,
             fontSize: 18),
            ),
       SizedBox(
            height: 10,
           ),
    Row(
             children: <Widget>[
            TextField(
              autofocus: true,
              controller: _quantityController,
              decoration: InputDecoration(
              hintText: 'Drug quantity here',
              )
          ),
    SizedBox(
         width: 20,
    ),
            ],
          ),
          ],
        ),
      ),
             SizedBox(
                height: 70,
                  ),
                   Center(
                        child: ButtonTheme(
                              minWidth: 350,
                               height: 60,
                          child: RaisedButton(
                                elevation: 0.0,
                       onPressed: () {
                                  _editSchedule(context);
                       },
                            color: appThemeLight.buttonColor,
                           shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10.0),
                   ),

                           child: Text(
                                  'Change Schedule',
                                   style: TextStyle(
                              fontSize: 20,
                         ),
                    ),
                     textColor: Colors.white,
         ),
        ),
    ),
        ],
        ),

    );
  }
}
