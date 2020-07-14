import 'package:flutter/material.dart';
import 'package:food_project/ui/shared/app_theme.dart';
import 'core/router/route.dart';
import 'ui/shared/size_fit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 对ZCSizeFit 进行初始化
    ZCSizeFit.initialize();

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

