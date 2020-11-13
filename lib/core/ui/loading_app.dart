import 'package:tttradionetwork/core/ui/responsive_safe_area.dart';
import 'package:tttradionetwork/core/util/image_helper.dart';
import 'package:ms_material_color/ms_material_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class LoadingApp extends StatefulWidget {
  @override
  _LoadingAppState createState() => _LoadingAppState();
}

class _LoadingAppState extends State<LoadingApp> with SingleTickerProviderStateMixin {

  AnimationController animController;
  Animation<double> animation;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    try {
      animController = AnimationController(
          duration: Duration(seconds: 2), vsync: this);
      final curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      );

      animation = Tween<double>(
          begin: 0, end: 2 * math.pi).animate(curvedAnimation)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            animController.reverse();
          } else if (status == AnimationStatus.dismissed) {
            animController.forward();
          }}
        );
      animController.forward();
    }catch(e) {
      print("error, _initAnimation: $e");
      animController.dispose();
    }
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      builder: (_) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: FadeTransition(
                    opacity: animation,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: new Image.asset(ImageHelper.LOGO),
                    ),
                  ),
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(MsMaterialColor(0xFFC62828)),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
