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

class ZCHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ZCHomeProductItem("Apple1", "Macbook1", "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2196657174,1994863858&fm=26&gp=0.jpg"),
        SizedBox(height: 5),
        ZCHomeProductItem("Apple2", "Macbook2", "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3368267992,623076164&fm=26&gp=0.jpg"),
        SizedBox(height: 5),
        ZCHomeProductItem("Apple3", "Macbook4", "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1422590462,2950091126&fm=26&gp=0.jpg"),
      ],
    );
  }
}


class ZCHomeProductItem extends StatelessWidget {

  final String title;
  final String desc;
  final String imageURL;

  final textStyle1 = TextStyle(fontSize: 25, color: Colors.orange);
  final textStyle2 = TextStyle(fontSize: 20, color: Colors.red);

  /// 构造函数
  ZCHomeProductItem(this.title, this.desc, this.imageURL);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 5, /// 设置边框的宽度
          color: Colors.orange, /// 设置监控的颜色
        ),
      ) ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,  /// 主轴
        crossAxisAlignment: CrossAxisAlignment.start, /// 交叉轴
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(title, style: textStyle1),
            ],
          ),
          SizedBox(height: 8),
          Text(desc, style: textStyle2),
          SizedBox(height: 8),
          Image.network(imageURL)
        ],
      ),
    );
  }
}




