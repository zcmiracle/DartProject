import 'package:flutter/material.dart';

class ZCHomeAppBar extends AppBar {
  // 继承AppBar需要重写构造器
  ZCHomeAppBar(BuildContext context) : super(
    title: Text("美食广场"),
    leading: Builder(
      builder: (ctx) {
        return IconButton(
          icon: Icon(Icons.build),
          onPressed: () {
            Scaffold.of(ctx).openDrawer();
          },
      );
    } ,
  ));
}
