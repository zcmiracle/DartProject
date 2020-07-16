import 'package:flutter/material.dart';
import 'config/index.dart';
import 'provide/current_index_provide.dart';
import 'package:provider/provider.dart';
import 'pages/index_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentIndexProvide()),
      ],
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ZCString.mainTitle, // Flutter女装商城
      theme: ThemeData(
        primaryColor: ZCColor.primaryColor,
      ),
      home: IndexPage(),
    );
  }
}


/**
 * Provide借助了InheritWidget，将共享状态放到顶层MaterialApp之上。底层部件通过Provier获取该状态
 * 并且通过混合ChangeNotifier通知依赖于该状态的组件刷新
 */