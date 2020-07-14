import 'package:flutter/material.dart';
import 'home_content.dart';

class ZCHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食广场"),
      ),
      body: ZCHomeContent(),
    );
  }
}
