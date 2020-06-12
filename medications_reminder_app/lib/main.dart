import 'package:flutter/material.dart';
import 'package:medications_reminder_app/DB/db.dart';
import 'package:medications_reminder_app/model/schedule_model.dart';
import 'package:provider/provider.dart';
import './ui/home_screen.dart';
import './ui/splash_screen.dart';
import './ui/drugs_description_screen.dart';
import './ui/add_reminders_screen.dart';
import 'app_theme/app_theme.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ScheduleAdapter());
  // await Hive.openBox<Schedule>('scheduleBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final navigatorKey = new GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) { 
         
    return ChangeNotifierProvider<DB>(
        create: (context)=> DB(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => SplashScreen(),
        '/home': (BuildContext context) => HomeScreen(),
        '/drugsdescription': (BuildContext context) => DrugsDescriptionScreen(),
        '/addreminders': (BuildContext context) => RemindersScreen(),
      },
      theme: appThemeLight,
      title: 'MedBuzz',
      ));
  }
}
