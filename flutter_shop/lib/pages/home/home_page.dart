import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/home/home_content.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页"),),
      body: ZCHomeContent(),
    );
  }
}
