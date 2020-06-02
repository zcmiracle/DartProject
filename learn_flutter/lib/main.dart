import 'package:flutter/material.dart';
import 'dart:ui';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ZCHomePage(),
    );
  }
}

class ZCHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础Widget",),
      ),
      body: ZCHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print("FloatingActionButton click"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class ZCHomeContent extends StatefulWidget {
  @override
  /// 没有build方法，只有createState方法，只能去State中才能有build方法
  _ZCHomeContentState createState() => _ZCHomeContentState();
}

class _ZCHomeContentState extends State<ZCHomeContent> {

  final imageURL = "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=10190708,1439802928&fm=11&gp=0.jpg";

  @override
  Widget build(BuildContext context) {
    /// 1、默认情况下Button上下有一定间距
    /// 2、Button变小：
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text("Flat Button"),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          color: Colors.red,
          textColor: Colors.white,
          onPressed: () {},
        ),
        FlatButton(
          child: Text("Flat Button"),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          color: Colors.red,
          textColor: Colors.white,
          onPressed: () {},
        )
      ],
    );
  }
}