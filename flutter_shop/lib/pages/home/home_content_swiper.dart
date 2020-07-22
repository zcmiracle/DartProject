import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/index.dart';
import '../../routers/application.dart';

class HomeContentSwiper extends StatelessWidget {

  final List dataLists;
  /// 构造方法
  HomeContentSwiper(this.dataLists);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      height: 180.px,
      width: 750.px,
      child: Swiper(
        autoplay: true,
        pagination: SwiperPagination(),
        itemCount: dataLists.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: Image.network(
              "${dataLists[index]["image"]}",
              fit: BoxFit.cover,
            ),
            onTap: () {
              Application.router.navigateTo(context, "/detail?id=${dataLists[index]['goodsId']}");
            },
          );
        },
      ),
    );
  }
}
