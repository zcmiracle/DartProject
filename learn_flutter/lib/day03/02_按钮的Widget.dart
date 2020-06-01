import 'package:flutter/material.dart';

class ZCHomeContent extends StatefulWidget {
  @override
  _ZCHomeContentState createState() => _ZCHomeContentState();
}

class _ZCHomeContentState extends State<ZCHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        /// 1.RaisedButton
        RaisedButton(
          child: Text("RaiseButton"),
          textColor: Colors.red,
          color: Colors.purple,
          onPressed: () => print("RaiseButton Click"),
        ),

        /// 2.FlatButton
        FlatButton(
          child: Text("FlatButton"),
          color: Colors.orange,
          onPressed: () => print("FlatButton Click"),
        ),

        /// 3.OutlineButton  边框按钮
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: () => print("OutlineButton Click"),
        ),

        /// 4.FloatingActionButton 悬浮按钮
        FloatingActionButton(
          child: Text("FloatingActionButton"),
          onPressed: () => print("FloatingActionButton click"),
        ),

        /// 5.自定义Button 图标 + 文字 + 背景 + 圆角
        FlatButton(
          color: Colors.amberAccent,
          shape: RoundedRectangleBorder(
            /// 设置圆角
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            /// 主轴上的大小
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.favorite, color: Colors.red),
              Text("喜欢按钮")
            ],
          ),
          onPressed: (){
            print("自定义喜欢按钮点击");
          },
        ),

      ],
    );
  }
}

