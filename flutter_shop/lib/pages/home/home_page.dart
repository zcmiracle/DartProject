import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/home/home_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(title: Text("首页"),),
      body: ZCHomeContent(),
    );
  }
}
