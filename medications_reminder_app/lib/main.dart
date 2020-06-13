import 'package:flutter/material.dart';
import 'package:medications_reminder_app/DB/db.dart';
import 'package:medications_reminder_app/model/schedule_model.dart';
import 'package:provider/provider.dart';
import './ui/splash_screen.dart';
import 'app_theme/app_theme.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ScheduleAdapter());
  await Hive.openBox('onboarding');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final navigatorKey = new GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) { 
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
    return ChangeNotifierProvider<DB>(
        create: (context)=> DB(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: appThemeLight,
      title: 'MedBuzz',
      ));
  }
}
