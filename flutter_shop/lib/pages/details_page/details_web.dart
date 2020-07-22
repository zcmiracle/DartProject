import 'package:flutter/material.dart';
import '../../provide/detail_info_provide.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var goodDetail = Provider.of<DetailsInfoProvide>(context).goodsInfo.data
        .goodInfo.goodsDetail;
    var isLeft = Provider.of<DetailsInfoProvide>(context).isLeft;

    if (isLeft) {
      return Container(
        child: Html(
          data: goodDetail.toString(),
        ),
      );
    } else {
      return Container(
        width: ScreenUtil().setWidth(750),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Text("暂时没有数据"),
      );
    }
  }
}
