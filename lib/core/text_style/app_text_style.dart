
import 'package:flutter/material.dart';

class AppTextStyle {


  static TextStyle _appTextStyle({required double fontSize,
    required Color color,
    required FontWeight fontWeight}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }


  static TextStyle regularS10() {
    return _appTextStyle(
        fontSize: 10,
        color: Colors.white,
        fontWeight: FontWeight.normal
    );
  }

  static TextStyle mediumS12() {
    return _appTextStyle(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.w400
    );
  }
  static TextStyle boldS14() {
    return _appTextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w500
    );
  }
}
