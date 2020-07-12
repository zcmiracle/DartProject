import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:learn_flutter/douban/service/home_request.dart';
import 'package:learn_flutter/douban/service/http_request.dart';

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
//    dio.get("https://httpbin.org/get").then((res) {
//      print(res);
//    });
//
//    dio.post("https://httpbin.org/post").then((res) {
//      print(res);
//    });



//    HttpRequest.request("https://httpbin.org/get", parameter: {"name": "miracle"}, ).then((res) {
//      print(res);
//    }).catchError((error) {
//      print(error);
//    });

     HomeRequest.requestMovieList(0).then((res) {
//       setState(() {
         print(res);
//       });
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
