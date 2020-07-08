import 'package:flutter/material.dart';

/// 评星组件
class ZCStarRating extends StatefulWidget {

  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unSelectedColor;
  final Color selectedColor;
  final Widget unSelectedImage;
  final Widget selectedImage;

  ZCStarRating({
    @required
    this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unSelectedColor = const Color(0xFFBBBBBB),
    this.selectedColor = const Color(0xFFFF0000),
    Widget unselectedImage,
    Widget selectedImage,
  }): unSelectedImage = unselectedImage ?? Icon(Icons.star_border, color: unSelectedColor, size: size),
        selectedImage = selectedImage ?? Icon(Icons.star, color: selectedColor, size: size);

  @override
  _ZCStarRatingState createState() => _ZCStarRatingState();
}

class _ZCStarRatingState extends State<ZCStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(mainAxisSize: MainAxisSize.min, children: buildUnselectedStar()),
        Row(mainAxisSize: MainAxisSize.min, children: buildSelectedStar()),
      ],
    );
  }

  /// 未选中star
  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return Icon(Icons.star_border, color: widget.unSelectedColor, size: widget.size);
    });
  }

  /// 选中star
  List<Widget> buildSelectedStar() {
    /// 1、创建stars
    List<Widget> stars = [];
    final star = Icon(Icons.star, color: widget.selectedColor, size: widget.size);

    /// 2、构建慢的star
    double oneValue = widget.maxRating / widget.count;
    int entireCount  = (widget.rating / oneValue).floor(); /// floor()向下取证
    for(var i = 0; i < entireCount; i ++) {
      stars.add(star);
    }

    /// 3、构建部分填充star
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    final halfStar = ClipRect(
        clipper: ZCStarClipper(leftWidth),
        child: star
    );
    stars.add(halfStar);

    /// 4、边界测试
    if (stars.length > widget.count) {
      return stars.sublist(0, widget.count);
    }
    return stars;
  }
}

/// 抽象方法子类必须实现父类的方法 abstract
class ZCStarClipper extends CustomClipper<Rect> {

  double width;
  ZCStarClipper(this.width);

  @override
  getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  /// 重新裁剪
  @override
  bool shouldReclip(ZCStarClipper oldClipper) {
    return oldClipper.width != this.width;
  }
}
