import 'package:flutter/material.dart';

class ZCDetailPage extends StatelessWidget {

  static const String routeName = "/detail";

  // 构造器
  final String _message;
  ZCDetailPage(this._message);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // 当返回为true时，可以自动返回flutter帮助我们执行返回操作
        // 当返回为false，自行写返回代码
        _backToHome(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Router详情"),
//        leading: IconButton(icon: Icon(Icons.arrow_back),
//          onPressed: () {
//            _backToHome(context);
//          },
//        ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_message, style: TextStyle(fontSize: 20, color: Colors.red),),
              RaisedButton(
                child: Text("回到首页"),
                onPressed:() => _backToHome(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _backToHome(BuildContext context) {
    print("回到首页");
    Navigator.of(context).pop("A detail message");
  }

}
