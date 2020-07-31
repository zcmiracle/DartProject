import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animation",
      home: ZCHomePage(),
    );
  }
}

class ZCHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画的学习"),
      ),
      body: ZCHomeContent(),
    );
  }
}


/**
 *  Animation: 抽象类
 *    监听动画值的改变
 *    监听动画状态的改变
 *    value
 *    status
 *    抽象类 不能实例化，只能用子类 可以用工厂构造方法进行实例化
 *  AnimationController 继承自Animation
 *    vsync：同步信号 一秒钟刷新多少次
 */
class ZCHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AnimationController
    return Container();
  }
}

