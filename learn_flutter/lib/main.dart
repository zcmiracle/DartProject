import 'package:flutter/material.dart';

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
      body: ZCHomeContent()
    );
  }
}

class ZCHomeContent extends StatefulWidget {
  @override
  _ZCHomeContentState createState() => _ZCHomeContentState();
}

class _ZCHomeContentState extends State<ZCHomeContent> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton();
  }
}
