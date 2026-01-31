import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ramy/screen/splash.dart';
import 'constants/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سيرة مفكر',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryGold,
        scaffoldBackgroundColor: AppColors.black,
        brightness: Brightness.dark,
      ),
      home: const SplashScreen(),
    );
  }
}
