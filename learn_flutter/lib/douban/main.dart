import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:learn_flutter/douban/widgets/star_rating.dart';
import 'package:learn_flutter/douban/widgets/dash_line.dart';
import 'package:learn_flutter/douban/pages/main/main.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ZCMainPage(),
    );
  }
}
