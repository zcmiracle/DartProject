import 'package:flutter/material.dart';
import 'package:food_project/ui/shared/app_theme.dart';
import 'core/router/route.dart';

// xcode11.4 创建项目会出现问题
// https://flutter.dev/docs/development/ios-project-migration

// 可以抽取到这个文件里面
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '美食广场',

      // 关于主题
      theme: ZCAppTheme.normalTheme,

      // 关于路由
      initialRoute: ZCRouter.initialRoute,
      routes: ZCRouter.routes,
      onGenerateRoute: ZCRouter.generateRoute,
      onUnknownRoute: ZCRouter.unknownRoute,
    );
  }
}
