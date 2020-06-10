import 'package:flutter/material.dart';
import 'package:medications_reminder_app/model/schedule_model.dart';
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
  await Hive.openBox<Schedule>('sheduleBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => SplashScreen(),
        '/home': (BuildContext context) => HomeScreen(),
        '/drugsdescription': (BuildContext context) => DrugsDescriptionScreen(),
        '/addreminders': (BuildContext context) => RemindersScreen(),
      },
      theme: appThemeLight,
      title: 'MedBuzz',
      );
  }
}
