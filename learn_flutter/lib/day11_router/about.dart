import 'package:flutter/material.dart';

class ZCAbout extends StatelessWidget {

  static const String routeName = "/about";


  @override
  Widget build(BuildContext context) {

    /// 拿到数据
    final _message = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("关于页面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_message, style: TextStyle(fontSize: 20, color: Colors.orange),),
            RaisedButton(
              child: Text("回到首页"),
              onPressed: () {
                Navigator.of(context).pop("123");
              },
            ),
          ],
        ),
      ),
    );
  }
}
