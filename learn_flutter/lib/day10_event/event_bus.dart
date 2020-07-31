import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:event_bus/event_bus.dart';

// 1、创建全局的EventBus对象
final eventBus = EventBus();

class UserInfo {
  String nickName;
  int level;

  UserInfo(this.nickName, this.level);
}

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
      appBar: AppBar(title: Text("Events测试"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ZCButton(),
            ZCText(),
          ],
        ),
      ),
    );
  }
}

class ZCText extends StatefulWidget {
  @override
  _ZCTextState createState() => _ZCTextState();
}

class _ZCTextState extends State<ZCText> {

  String _message = "Hello World";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 监听事件的类型
    eventBus.on<UserInfo>().listen((data) {
      print(data.nickName);
      print(data.level);
      setState(() {
        _message = "${data.nickName} - ${data.level}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message, style: TextStyle(fontSize: 30, color: Colors.red,),);
  }
}

class ZCButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("按钮点我"),
      onPressed: () {
        // 发送事件
        final info = UserInfo("Fearless", 20);
        eventBus.fire(info);
      },
    );
  }
}

