import 'package:flutter/material.dart';

// 万物皆是Widget(对象)
// 多态：父类引用 指向子类对象

main() {
  // 1、runApp函数
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("导航栏Flutter首页"),
        ),
        body: Center(
          child: Text(
            "Hello world Fearless",
            style: TextStyle(
                // 命名可选参数
                fontSize: 30,
                color: Colors.orange
            ),
          ),
        ),
      ),
    )
  );

}

