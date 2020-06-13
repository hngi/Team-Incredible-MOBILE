import 'package:flutter/material.dart';
import 'package:medications_reminder_app/responsiveness/size_config.dart';
import 'package:medications_reminder_app/ui/scroll_configuration.dart';
import 'package:medications_reminder_app/navigation/page_transitions/animations.dart';
import 'package:medications_reminder_app/navigation/app_navigation/navigation.dart';
import 'package:medications_reminder_app/ui/home_screen.dart';
import 'package:hive/hive.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        First(image:'images/waiting.png', text:'Say goodbye to missing your dosage.'),
        First(image:'images/healthy.jpg', text:'Stick to your prescription.\nSpeed up your recovery.'),
        First(image:'images/family.jpg', text:'Set schedules for your loved ones too.'),
        Second()
      ],
    );
  }
}

class First extends StatelessWidget {
  final String image;
  final String text;
 final SizeConfig config = SizeConfig();
 First({this.image, this.text});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: config.xMargin(context, 7), vertical: config.yMargin(context, 4)),
        child: ScrollConfiguration(
          behavior: CustomScrollBehavior(),
                  child: SingleChildScrollView(
                    child: Container(
            height: height,
            width: width,
            child: Column(
              children: <Widget>[
                Container(
                    height: height *.45,
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.contain
                      )
                    ),
                ),
                SizedBox(height: config.yMargin(context, 2.5)),
                Expanded(
                    child: ForwardAnimation(
                      milliseconds: 500,
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: config.textSize(context, 10),
                          fontWeight: FontWeight.w600
                        )
                      ),
                    )
                    ,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                          ImageAnimation(
                            milliseconds: 600,
                            color: Theme.of(context).primaryColorLight,
                            child: Container(
                              margin: EdgeInsets.only(bottom: config.yMargin(context, 8)),
                              height: config.yMargin(context, 5.2),
                              width: width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                Icon(
                                  Icons.arrow_forward,
                                  color:Theme.of(context).buttonColor,
                                  size: config.xMargin(context, 10)
                                ),
                                SizedBox(width:config.xMargin(context,3)),
                                Text(
                                  'Swipe',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: config.textSize(context, 5.5),
                                    fontWeight: FontWeight.w500
                                  )
                                )
                              ],)
                            ),
                          )
                    ],)
            ],),
          ),
                  ),
        ),
      )
    );
  }
}

class Second extends StatelessWidget {
  var box = Hive.box('onboarding');
  final SizeConfig config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: config.xMargin(context, 7), vertical: config.yMargin(context, 6)),
        child: Container(
        height: height,
        width: width,
        color:Theme.of(context).primaryColorLight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                ForwardAnimation(
                      milliseconds: 500,
                      child: Text(
                        'MedBuzz is your digital wholesome health pal.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: config.textSize(context, 10),
                          fontWeight: FontWeight.w600
                        )
                      ),
                    )
                    ,
                    SizedBox(height: config.yMargin(context, 8),),
                    Column(
                      children: <Widget>[
                          ImageAnimation(
                            milliseconds: 600,
                            color: Theme.of(context).primaryColorLight,
                            child: Container(
                              height: config.yMargin(context, 7),
                              width: config.xMargin(context, 80),
                              child: FlatButton(
                                color: Theme.of(context).buttonColor,
                                splashColor: Colors.greenAccent,
                                onPressed: (){
                                  box.put('status', 'true');
                                   Navigation().pushToAndReplace(context, HomeScreen());
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(config.yMargin(context, 4))
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color:Theme.of(context).primaryColorLight,
                                    size: config.xMargin(context, 10)
                                  ),
                                  SizedBox(width:config.xMargin(context,3)),
                                  Text(
                                    'Get started',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColorLight,
                                      fontSize: config.textSize(context, 6),
                                      fontWeight: FontWeight.w500
                                    )
                                  )
                                ],),
                              )
                            ),
                          )
                    ],)

        ],),
        
      ),)
    );
  }
}