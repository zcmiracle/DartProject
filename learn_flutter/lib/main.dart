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

/// 1、自己写Widget
/// 2、某些Widget中会创建RenderObject
/// 3、每一个Widget都会创建一个Element对象
/// 4、mount方法（系统调用）：










//
//class ZCHomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("基础Widget",),
//      ),
//      body: ZCHomeContent(),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: () => print("FloatingActionButton click"),
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//    );
//  }
//}
//
//class ZCHomeContent extends StatefulWidget {
//  @override
//  /// 没有build方法，只有createState方法，只能去State中才能有build方法
//  _ZCHomeContentState createState() => _ZCHomeContentState();
//}
//
//class _ZCHomeContentState extends State<ZCHomeContent> {
//
//  final imageURL = "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=10190708,1439802928&fm=11&gp=0.jpg";
//
//  @override
//  Widget build(BuildContext context) {
//    /// 1、默认情况下Button上下有一定间距
//    /// 2、Button变小：
//    return Column(
//      children: <Widget>[
//        FlatButton(
//          child: Text("Flat Button"),
//          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//          color: Colors.red,
//          textColor: Colors.white,
//          onPressed: () {},
//        ),
//        FlatButton(
//          child: Text("Flat Button"),
//          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//          color: Colors.red,
//          textColor: Colors.white,
//          onPressed: () {},
//        )
//      ],
//    );
//  }
//}