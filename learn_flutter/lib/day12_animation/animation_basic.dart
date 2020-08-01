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

class ZCHomePage extends StatefulWidget {
  @override
  _ZCHomePageState createState() => _ZCHomePageState();
}

/// 混入一个类  with SingleTickerProviderStateMixin
/// 混入一个类，条件：必须继承StatefulWidget
class _ZCHomePageState extends State<ZCHomePage> with
    SingleTickerProviderStateMixin {

  /// 创建AnimationController
  AnimationController _controller;
  Animation _animation;
  Animation _sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// 1、创建AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
//      lowerBound: 0.0,
//      upperBound: 1.0,
    );

    /// 2、给动画设置curved值
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    /// 3、Tween
    _sizeAnimation = Tween(begin: 50.0, end: 150.0).animate(_animation);

    /// 4、监听动画值的改变
    _controller.addListener(() {
      setState(() {});
    });

    /// 5、监听动画的状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画的学习"),
      ),
      body: Center(
        child: Icon(Icons.favorite, color: Colors.red, size: _sizeAnimation.value,),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            if (_controller.isAnimating) {
              _controller.stop();
            } else if (_controller.status == AnimationStatus.forward) {
              _controller.forward();
            } else if (_controller.status == AnimationStatus.reverse) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          });
        },
      ),
    );
  }
}


class ZCAnimationIcon extends AnimatedWidget {

  final Animation _sizeAnim;
  ZCAnimationIcon(this._sizeAnim);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Icon(Icons.favorite, color: Colors.red, size: _sizeAnim.value,);

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
 *    vsync：同步信号（this -> with SingleTickerProviderStateMixin）
 *    forward() 向前执行动画
 *    reverse() 反转执行动画
 *  CurvedAnimation：
 *    作用：设置动画执行的速率(速度曲线)
 *  TWeen：设置动画执行的value范围
 *    begin：开始值
 *    end：结束值
 */

