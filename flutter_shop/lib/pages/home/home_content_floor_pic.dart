import 'package:flutter/material.dart';

class HomeContentFloorPic extends StatelessWidget {

  final Map floorPic;
  /// 构造方法 最好写可选参数
  HomeContentFloorPic(this.floorPic);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: InkWell(
        child: Image.network(floorPic['PICTURE_ADDRESS'], fit: BoxFit.cover,),
        onTap: () {

        },
      ),
    );
  }
}
