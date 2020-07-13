import 'package:flutter/material.dart';
import 'package:food_project/ui/shared/app_theme.dart';
import 'core/router/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 标题
      title: '美食广场',

      // 主题
      theme: ZCAppTheme.normalTheme,

      // 路由
      initialRoute: ZCRouter.initialRoute,
      routes: ZCRouter.routes,
      onGenerateRoute: ZCRouter.generateRoute,
      onUnknownRoute: ZCRouter.unknownRoute,
    );
  }
}

