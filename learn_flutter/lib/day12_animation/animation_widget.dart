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
        child: ZCAnimationIcon(_sizeAnimation),
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

/// 缺点1：每次都需要创建一个类
/// 缺点2：如果构建的Widget有子类，那么子类依然会重复的build
class ZCAnimationIcon extends AnimatedWidget {

  /// 方法一
//  final Animation _sizeAnim;
//  ZCAnimationIcon(this._sizeAnim): super(listenable: _sizeAnim);
 
  /// 方法二
  ZCAnimationIcon(Animation anim): super(listenable: anim);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Animation anim = listenable;
    return Icon(Icons.favorite, color: Colors.red, size: anim.value,);
  }
}


