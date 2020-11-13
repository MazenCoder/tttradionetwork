import 'package:flutter/material.dart';
import 'dart:ui';


class ClipperHome extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2, size.height);
//    path.lineTo(x, y)


//    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height);
//    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}