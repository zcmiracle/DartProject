import 'package:flutter/material.dart';
import '../douban/pages/main/main.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.green,        /// 应用程序主题色顶部导航栏和底部导航栏可看出
        splashColor: Colors.transparent,    /// 点击按钮时的渐变背景色
        highlightColor: Colors.transparent, /// 去除高亮效果
      ),
      home: ZCMainPage(),
    );
  }
}

