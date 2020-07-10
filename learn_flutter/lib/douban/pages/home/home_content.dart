import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
    /// 1、创建Dio对象
    final dio = Dio();

    /// 2、发送网络请求
    dio.get("https://httpbin.org/get").then((res) {
      print(res);
    });

    dio.post("https://httpbin.org/post").then((res) {
      print(res);

    });

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
