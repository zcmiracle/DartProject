import 'package:flutter/material.dart';
import '../../model/home_model.dart';
import '../../widgets/star_rating.dart';
import '../../widgets/dash_line.dart';

class ZCHomeMovieItem extends StatelessWidget {

  final MovieItem movie;
  ZCHomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 8.0, color: Color(0xFFCCCCCC)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(),
          SizedBox(height: 6),
          buildContent(),
          SizedBox(height: 6),
          buildFooter(),
        ],
      ),
    );
  }

  // 1、头部的排名
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 230, 207, 158),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
          "No.${movie.rank}",
          style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 131, 95, 36)
          )
      ),
    );
  }

  // 2、内容的布局
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentImage(),
        SizedBox(width: 8,),
        buildContentInfo(),
        SizedBox(width: 8,),
        buildContentLine(),
        SizedBox(width: 8,),
        buildContentWish(),
      ],
    );
  }

  // 电影图片海报
  Widget buildContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.network(
        movie.imageURL,
        height: 150,
      ),
    );
  }

  // 电影内容信息
  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildContentInfoTitle(),
          SizedBox(height: 8),
          buildContentInfoRate(),
          SizedBox(height: 8,),
          buildContentInfoDesc(),
        ],
      ),
    );
  }

  // 电影标题 + 年份
  Widget buildContentInfoTitle() {
     return Text.rich(
       TextSpan(children: [
         /// 播放按钮图标
         WidgetSpan(
           child: Icon(
             Icons.play_circle_outline,
             color: Colors.pink,
             size: 40,
           ),
           baseline: TextBaseline.ideographic,
           alignment: PlaceholderAlignment.middle,
         ),
         /// 已废弃
         ...movie.title.runes.map((rune) {
           return WidgetSpan(
               child: Text(
                 new String.fromCharCode(rune),
                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
               ),
               alignment: PlaceholderAlignment.middle
           );
         }).toList(),
//         /// 电影标题
//         WidgetSpan(
//           child: Text(
//             "${movie.title}",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           alignment: PlaceholderAlignment.middle,
//         ),
         /// 电影年份
         WidgetSpan(
           child: Text(
             "(${movie.playDate})",
             style: TextStyle(fontSize: 16, color: Colors.grey),
           ),
           alignment: PlaceholderAlignment.middle,
         ),
       ])
     );
  }

  // 评分
  Widget buildContentInfoRate() {
    return Row(
      children: <Widget>[
        ZCStarRating(rating: 9, size: 20,),
        SizedBox(width: 6,),
        Text("${movie.rating}", style: TextStyle(fontSize: 16),),
      ],
    );
  }

  // 详细内容： 剧情 + 导演 + 演员列表
  Widget buildContentInfoDesc() {
    // 1、字符串拼接
    final genresString = movie.genres.join(" ");
    final directorString = movie.director.name;
    final actorString = movie.casts.map((item) => item.name).toList().join(" ");
    return Text(
      "$genresString / $directorString / $actorString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  // 内容的分割线
  Widget buildContentLine() {
    return Container(
      height: 100,
      child: ZCDashLine(
        axis: Axis.vertical,
        dashedWidth: .5,
        dashedHeight: 6,
        count: 10,
        color: Colors.pink,
      ),
    );
  }

  // 内容想看
  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/home/wish.png"),
          Text("想看", style: TextStyle(fontSize: 18, color: Color.fromARGB(255,
              235, 170, 60))),
        ],
      ),
    );
  }

  // footer
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        movie.originalTitle,
        style: TextStyle(fontSize: 20, color: Color(0xFF666666))),
    );
  }
}