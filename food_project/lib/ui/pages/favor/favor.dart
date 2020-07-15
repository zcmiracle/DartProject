import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favor_content.dart';

class ZCFavorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我的收藏"),),
      body: ZCFavorContent(),
    );
  }
}
