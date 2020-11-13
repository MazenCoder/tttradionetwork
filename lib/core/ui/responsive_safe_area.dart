import 'dart:io';

import 'package:flutter/material.dart';

typedef ResponsiveBuilder = Widget Function(BuildContext context);

class ResponsiveSafeArea extends StatelessWidget {

  const ResponsiveSafeArea({
    @required ResponsiveBuilder builder,
    Key key,
  }) : responsiveBuilder = builder, super(key: key);

  final ResponsiveBuilder responsiveBuilder;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Container(
        color: Colors.pink,
        child: SafeArea(
          child: responsiveBuilder(context)
        ),
      );
    } else {
      return Container(
        color: Colors.white,
        child: SafeArea(
          bottom: false,
          child: responsiveBuilder(context)
        ),
      );
    }
  }
}