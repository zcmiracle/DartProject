import 'package:flutter/material.dart';
import 'home_app_bar.dart';
import 'home_drawer.dart';
import 'home_content.dart';

class ZCHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZCHomeAppBar(context),
      body: ZCHomeContent(),
      drawer: ZCHomeDrawer(),
    );
  }
}
