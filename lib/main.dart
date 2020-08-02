import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_design_ui/screens/home_page.dart';
import 'package:tiktok_design_ui/screens/intro_base_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tik Tok UI',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroBaseScreen(),
      //home: Home(),
    );
  }
}

