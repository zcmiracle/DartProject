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
          title: Text("Text文本",),
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
    return Text.rich( /// 富文本
      TextSpan(
//        text: "Fearless", /// 因为是命名可选参数
//        style: TextStyle(color: Colors.orange),
        children: [
          TextSpan(text: "Fearless", style: TextStyle(color: Colors.red, fontSize: 20)),
          WidgetSpan(child: Icon(Icons.favorite, color: Colors.red)),
          TextSpan(text: "Miracle", style: TextStyle(color: Colors.orange, fontSize: 20)),
          WidgetSpan(child: Icon(Icons.favorite, color: Colors.red)),
          TextSpan(text: "Happy", style: TextStyle(color: Colors.purple, fontSize: 20)),
        ],
      ),
    );
  }
}


/// Text Widget
class TextDemo extends StatelessWidget {

  const TextDemo({
    Key key,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "FearlessFearlessFearlessFearlessFearlessFearlessFearlessFearless".toLowerCase(),
      textAlign: TextAlign.left,  /// 文本对齐方式
      maxLines: 5,  /// 显示多少行
      overflow: TextOverflow.ellipsis, /// 超出部分显示...
      textScaleFactor: 2, /// 文本缩放因子
      style: TextStyle(
          fontSize: 30,
          color: Colors.red,
          fontWeight: FontWeight.bold
      ),
    );
  }
}


