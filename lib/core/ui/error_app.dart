import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tttradionetwork/core/ui/responsive_safe_area.dart';
import 'package:tttradionetwork/core/util/image_helper.dart';
import 'package:tttradionetwork/pages/splash_page.dart';
import 'package:flutter/material.dart';



class ErrorApp extends StatelessWidget {
  final String message;
  ErrorApp([this.message]);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSafeArea(
      builder: (context) => Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Oops',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Image.asset(ImageHelper.ERROR, height: 220),
                  SizedBox(height: 5,),
                  Text(message != null ? message : 'Something wrong',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  RaisedButton.icon(
                    icon: Icon(MdiIcons.refresh),
                    color: Colors.red.shade800,
                    textColor: Colors.white,
                    label: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Text('try again'),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) => SplashPage()), (route) => false);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
