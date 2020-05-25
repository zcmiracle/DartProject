import 'package:flutter/material.dart';

// 箭头函数
main() => runApp(MyApp());

// 无状态的Widget：内容是确定没有状态的改变
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ZCHomePage()
    );
  }
}

class ZCHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航栏Flutter首页"),
      ),
      body: ZCHomeBody();
    );
  }
}

class ZCHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hello world Fearless",
        style: TextStyle(
          // 命名可选参数
          fontSize: 30,
          color: Colors.orange
        ),
      ),
    );
  }
}

