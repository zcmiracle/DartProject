import 'package:flutter/material.dart';
import 'detail.dart';
import 'about.dart';
import 'unknow.dart';
import 'router.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      routes: ZCRouter.routes,
      initialRoute: ZCRouter.initialRoute,
      onGenerateRoute: ZCRouter.generateRoute,
      onUnknownRoute: ZCRouter.unknownRoute,
    );
  }
}

class ZCHomePage extends StatefulWidget {
  static const String routeName = "/";
  @override
  _ZCHomePageState createState() => _ZCHomePageState();
}

class _ZCHomePageState extends State<ZCHomePage> {

  String _homeMessage = "defalut message";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Router"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_homeMessage, style: TextStyle(fontSize: 20, color: Colors.red),),
            RaisedButton(
              child: Text("跳转到详情"),
              onPressed: () {
                _pushToDetail(context);
              },
            ),
            RaisedButton(
              child: Text("跳转到关于"),
              onPressed: () {
                _pushToAbout(context);
              },
            ),
            RaisedButton(
              child: Text("跳转到详情2"),
              onPressed: () {
                _pushToDetail2(context);
              },
            ),
            RaisedButton(
              child: Text("跳转到设置"),
              onPressed: () {
                _pushToSettings(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 跳转到详情页面
  void _pushToDetail(BuildContext context) {
    /// 1、普通的跳转方式
    Future result = Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return ZCDetailPage("A home message");
        },
      ),
    );

    /// 详情返回信息
    result.then((value ) {
      print(value);
      setState(() {
        _homeMessage = value;
      });
    });
  }

  /// 跳转到关于页面
  void _pushToAbout(BuildContext context) {
    Future result = Navigator.of(context).pushNamed(
      ZCAbout.routeName,
      arguments: "A home message",
    );

    /// 详情返回信息
    result.then((value ) {
      print(value);
      setState(() {
        _homeMessage = value;
      });
    });
  }

  /// 跳转到详情2页面
  void _pushToDetail2(BuildContext context) {
    Navigator.of(context).pushNamed(ZCDetailPage.routeName, arguments: "A home detail2 message");
  }

  /// 跳转到设置页面
  void _pushToSettings(BuildContext context) {
    Navigator.of(context).pushNamed("/22232323");
  }



}
