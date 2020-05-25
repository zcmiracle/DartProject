import 'package:flutter/material.dart';

// 箭头函数
main() => runApp(MyApp());

// 无状态的Widget：内容是确定没有状态的改变
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ZCHomePage()
    );
  }
}

class ZCHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("同意和解协议"),
        ),
        body: ZCHomeContentBody()
    );
  }
}


/// flag状态
/// Stateful不能定义状态：创建一个单独的类，这个类负责维护状态
class ZCHomeContentBody extends StatefulWidget {
  @override
  /// 抽象方法 必须实现方法 重写方法去实现
  _ZCHomeContentBodyState createState() => _ZCHomeContentBodyState();
}

/// State去构建Widget
class _ZCHomeContentBodyState extends State<ZCHomeContentBody> {

  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              value: flag,
              onChanged: (value){
                /// 更新(刷新)
                setState(() {
                  flag = value;
                });
              }),
          Text(
            "同意和解协议",
            style: TextStyle(
              fontSize: 20,
            ),)
        ],
      ),
    );
  }
}