import 'package:flutter/material.dart';

class ZCHomeContent extends StatefulWidget {
  @override
  _ZCHomeContentState createState() => _ZCHomeContentState();
}

class _ZCHomeContentState extends State<ZCHomeContent> {

  /// 初始化状态
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// 发送网络请求

  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(title: Text("item$index"));
      },
    );
  }
}
