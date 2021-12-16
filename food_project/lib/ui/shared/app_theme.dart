import 'package:flutter/material.dart';

class ZCAppTheme {
  // 1、共有属性
  static const double smallFontSize = 16;
  static const double normalFontSize = 22;
  static const double largeFontSize = 24;
  static const double xlargeFontSize = 30;

  // 2、普通模式
  static final Color normalTextColors = Colors.red;

  static final ThemeData normalTheme = ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,

      // 设置整个应用程序的背景颜色
    canvasColor: Color.fromRGBO(255, 254, 222, 1),
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: normalFontSize),
      // display1: TextStyle(fontSize: smallFontSize, color: Colors.black87,),
      // display2: TextStyle(fontSize: normalFontSize, color: Colors.black87),
      // display13: TextStyle(fontSize: largeFontSize, color: Colors.black87),
      // display4: TextStyle(fontSize: xlargeFontSize, color: Colors.black87, fontWeight: FontWeight.w400),
    ),
  );


  // 3、暗黑模式
  static final Color darkTextColors = Colors.green;

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      // body: TextStyle(fontSize: normalFontSize, color: darkTextColors)
    )
  );

}

