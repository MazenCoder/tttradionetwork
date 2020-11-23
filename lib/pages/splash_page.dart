import 'package:tttradionetwork/core/model/firebase_permission.dart';
import 'package:tttradionetwork/core/ui/loading_app.dart';
import 'package:tttradionetwork/pages/home_page.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  FirebasePermission permission;
  SplashPage(this.permission);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin<SplashPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingApp()
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2)).whenComplete(() {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) => HomePage(widget.permission),
      ), (route) => false);
    });
  }
}
