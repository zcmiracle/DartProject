import 'package:flutter/material.dart';

class ZCModalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("modal页面"),
      ),
      body: Center(
        child: Text("modal页面")
      ),
    );
  }
}
