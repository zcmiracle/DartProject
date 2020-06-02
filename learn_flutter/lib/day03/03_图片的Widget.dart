import 'package:flutter/material.dart';
import 'dart:ui';

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
        title: Text("ImageWidget",),
      ),
      body: ZCHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print("FloatingActionButton click"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class ZCHomeContent extends StatefulWidget {
  @override
  /// 没有build方法，只有createState方法，只能去State中才能有build方法
  _ZCHomeContentState createState() => _ZCHomeContentState();
}

class _ZCHomeContentState extends State<ZCHomeContent> {

  final imageURL = "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=10190708,1439802928&fm=11&gp=0.jpg";

  @override
  Widget build(BuildContext context) {

    /// 加载网络图片
//    return Image.network(imageURL);
//    return ImageNetworkDemo(imageURL: imageURL);

    /// 加载本地图片
    /// 1、在Flutter项目中创建一个文件夹，存储图片
    /// 2、在pubspec.yaml进行配置
    /// 3、使用图片
    // return Image(
    //   image: AssetImage("assets/images/girl.jpeg"),
    // );
    return Image.asset("assets/images/girl.jpeg");
  }
}

/// 加载网络图片
class ImageNetworkDemo extends StatelessWidget {

  const ImageNetworkDemo({
    Key key,
    @required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imageURL),
      width: 200,
      height: 200,
      /// 宽度一定，高度自适应 fitWidth
      /// 高度一定，宽度自适应 fitHeight
      fit: BoxFit.cover,
      /// 设置位置
//      alignment: Alignment.bottomCenter,
      /// 范围（-1 1）
      alignment: Alignment(-1, -5),
      ///
      color: Colors.red,
      /// 混入模式
      colorBlendMode: BlendMode.colorDodge,
      ///
      repeat: ImageRepeat.repeatY,
    );
  }
}


