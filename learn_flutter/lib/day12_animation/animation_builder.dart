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
      duration: Duration(seconds: 2),
    );

    /// 2、给动画设置curved值
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    /// 3、Tween
    _sizeAnimation = Tween(begin: 50.0, end: 150.0).animate(_animation);

    /// 4、监听动画的状态改变
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
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Icon(Icons.favorite, color: Colors.red, size: _sizeAnimation.value,);
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
}
