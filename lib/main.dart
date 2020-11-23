import 'package:tttradionetwork/core/util/str_helper.dart';
import 'package:ms_material_color/ms_material_color.dart';
import 'package:tttradionetwork/pages/splash_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/model/firebase_permission.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'core/ui/loading_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  DocumentReference permission = FirebaseFirestore.instance.doc('radio/permission');

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
      home: FutureBuilder<DocumentSnapshot>(
        future: permission.get(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.waiting:
              return LoadingApp();
            default:
              print(snapshot.data.data());
              final permission = FirebasePermission.fromJson(snapshot.data.data());
              return SplashPage(permission);
          }
        },
      ),
      // home: SplashPage(),
    );
  }
}
