import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:medications_reminder_app/model/schedule_model.dart';
import './ui/home_screen.dart';
import './ui/splash_screen.dart';
import './ui/drugs_description_screen.dart';
import './ui/add_reminders_screen.dart';
import 'app_theme/app_theme.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'DB/db.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final docsDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(docsDirectory.path);
  Hive.registerAdapter(ScheduleAdapter());
  DB().getSchedules();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => SplashScreen(),
        '/home': (BuildContext context) => HomeScreen(),
        '/drugsdescription': (BuildContext context) => DrugsDescriptionScreen(),
        '/addreminders': (BuildContext context) => RemindersScreen(),
      },
      theme: appThemeLight,
      title: 'Medications Reminder',
      );
  }
}
