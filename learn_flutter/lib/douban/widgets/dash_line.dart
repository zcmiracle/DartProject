import 'package:flutter/material.dart';

/// 虚线组件
class ZCDashLine extends StatelessWidget {

  /// 方向
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  ZCDashLine({
    /// 默认虚线水平排布
    this.axis = Axis.horizontal,
    this.dashedWidth = 1,
    this.dashedHeight = 1,
    this.count = 10,
    this.color = Colors.orange
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (_){
        return SizedBox(
          width: dashedWidth,
          height: dashedHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),
          ),
        );
      }),
    );
  }
}



//class ZCHomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text("豆瓣App",),
//        ),
//        body: Center(
////        child: ZCStarRating(rating: 11, count: 5),
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Container(
//                width: 200,
//                child: ZCDashLine(dashedWidth: 8, count: 15),
//              ),
//              Container(
//                height: 200,
//                child: ZCDashLine(axis: Axis.vertical, dashedHeight: 10, count: 15),
//              )
//            ],
//          ),
//        )
//    );
//  }
//}

