import 'package:flutter/material.dart';

/// This class (or a class that this class inherits from) is marked as '@immutable', but one or more of its instance fields aren't final: ZCHomeContentBody.flag
class ZCHomeContentBody extends StatelessWidget {

  /// 错误的 因为是StatelessWidget，里面的属性都是不可变的 用final，但是用final就不行实现下面的功能
  var flag = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        // 类似于flex布局
        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: Axis.vertical,
        children: <Widget>[
          Checkbox(
            /// 命名可选参数有名字
              value: true,
              /// 匿名函数
              onChanged: (value){
                flag = value;
              }
          ),
          Text("同意并遵守协议", style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }
}

