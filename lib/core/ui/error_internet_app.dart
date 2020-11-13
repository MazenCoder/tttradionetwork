import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tttradionetwork/core/ui/responsive_safe_area.dart';
import 'package:tttradionetwork/core/util/color_helper.dart';
import 'package:tttradionetwork/core/util/image_helper.dart';
import 'package:flutter/material.dart';
import 'loading_dialog.dart';



class ErrorInternetApp extends StatelessWidget {
  final String message;
  ErrorInternetApp([this.message]);

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
                  SizedBox(height: 5,),
                  Text(message != null ? message : 'Something wrong please try again',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Image.asset(ImageHelper.ERROR, height: 220),
                  SizedBox(height: 5,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
