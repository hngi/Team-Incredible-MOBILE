import 'package:flutter/material.dart';
import './ui/home_screen.dart';
import './ui/splash_screen.dart';
import './ui/drugs_description_screen.dart';
import './ui/add_reminders_screen.dart';
import './ui/edit_reminders.dart';
import 'app_theme/app_theme.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'model/schedule.dart';

// import 'model/schedule.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  Hive.registerAdapter(ScheduleAdapter());
  Hive.registerAdapter(TimeOfDayAdapter());
  await Hive.openBox<Schedule>('schedule');
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
        '/editreminders': (BuildContext context) => EditRemindersScreen(),
      },
      theme: appThemeLight,
      title: 'Medications Reminder',
    );
  }
}
