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
        title: Text("首页商城",),
      ),
      body: ZCHomeContent()
    );
  }
}

/// Widget是不加下划线_ ：暴露给别人使用的
class ZCHomeContent extends StatefulWidget {
  @override
  _ZCHomeContentState createState() => _ZCHomeContentState();
}

/// 下划线开头的文件在其他库是不能访问的
///
/// 为什么Flutter在设计的时候StatefulWidget的build方法放在State中
/// 1、build出来的Widget是需要依赖State中的变量（状态/数据）
/// 2、在Flutter的运行过程中：
/// Widget是不断的销毁和创建的，当我们自己的状态发生改变时，并不希望重新创建一个新的State
///
/// Widget Element RenderObject三者的关系
/// Widget 是描述信息
/// Element
/// RenderObject
///
/// child 和 children的区别：
/// child 中只能放一个元素
/// children：放一个数组
///
class _ZCHomeContentState extends State<ZCHomeContent> {

  int _counter = 0;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text("+"),
                color: Colors.pink,
                onPressed: () => print("点击+"),
              ),
              RaisedButton(
                child: Text("-"),
                color: Colors.purple,
                onPressed: () => print("点击-"),
              )
            ],
          ),
          Text("当前计数：$_counter"),
        ],
      ),
    );
  }
}

