import 'package:flutter/material.dart';
import 'dart:math';

/// 交织动画
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

class _ZCHomePageState extends State<ZCHomePage> with
    SingleTickerProviderStateMixin {

  /// 创建AnimationController
  AnimationController _controller;
  Animation _animation;

  Animation _sizeAnimation;
  Animation _colorAnimation;
  Animation _opacityAnimation;
  Animation _radiansAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// 1、创建AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    /// 2、给动画设置curved值
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    /// Tween
    /// 3.1 创建size的tween
    _sizeAnimation = Tween(begin: 10.0, end: 200.0).animate(_controller);
    /// 3.2 创建color的tween
    _colorAnimation = ColorTween(begin: Colors.orange, end: Colors.purple,).animate(_controller);
    /// 3.3 创建透明度的tween
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    /// 3.4 创建radians弧度的tween
    _radiansAnimation = Tween(begin: 0.0, end: 2 * pi).animate(_controller);

    ///
    _controller.addListener(() {
      setState(() {});
    });

    /// 3、监听动画的状态改变
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

    /// 大小变化动画
    /// 颜色变化动画
    /// 透明度变化动画
    /// 旋转动画：传入矩阵

    return Scaffold(
      appBar: AppBar(
        title: Text("动画的学习"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: 0.5,
              child: Transform(
                transform: Matrix4.rotationZ(_radiansAnimation.value),
                alignment: Alignment.center,
                child: Container(
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                  color: _colorAnimation.value,
                ),
              ),
            );
          },
        ),
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

