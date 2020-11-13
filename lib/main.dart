import 'package:tttradionetwork/core/util/str_helper.dart';
import 'package:ms_material_color/ms_material_color.dart';
import 'package:tttradionetwork/pages/splash_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StrHelper.NAME_APP,
      theme: ThemeData(
        // primarySwatch: Colors.red,
        primarySwatch: MsMaterialColor(0xFFC62828),
        primaryColor: MsMaterialColor(0xFFC62828),
        primaryTextTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white,),
          bodyText2: TextStyle(color: Colors.white,),
        ),
        primaryIconTheme: const IconThemeData.fallback().copyWith(
          color: Colors.white,
        ),
      ),
      home: SplashPage(),
    );
  }
}
