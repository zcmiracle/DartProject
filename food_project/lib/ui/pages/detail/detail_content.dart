import 'package:flutter/material.dart';
import '../../../core/model/meal_model.dart';
import '../../../core/extension/int_extension.dart';
import '../../shared/app_theme.dart';

class ZCDetailContent extends StatelessWidget {

  final ZCMealModel _meal;
  ZCDetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    // 也可以采取路由的方式 获取模型数据
//    final meal = ModalRoute.of(context).settings.arguments as ZCMealModel;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildBannerImage(),
          buildMakeTitle(context, "制作材料"),
          buildMakeMaterial(context),
          buildMakeTitle(context, "制作步骤"),
          buildMakeSteps(context),
        ],
      ),
    );
  }

  // 1、横幅图片
  Widget buildBannerImage() {
    return Container(
      /// 刚开始宽度是下面制作材料内容的宽度，然后撑开
      width: double.infinity,
      child: Image.network(_meal.imageUrl),
    );
  }

  // 2、制作材料
  Widget buildMakeMaterial(BuildContext context) {
    return buildContentList(
      context: context,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        /// 会新增内边距
        shrinkWrap: true,
        /// 内部不滚动
        physics: NeverScrollableScrollPhysics(),
        itemCount: _meal.ingredients.length,
        itemBuilder: (ctx, index) {
          return Card(
            color: Colors.amber,
            child: Text(_meal.ingredients[index]),
          );
        },
      ),
    );
  }

  // 3、制作步骤
  Widget buildMakeSteps(BuildContext context) {
    return buildContentList(
      context: context,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _meal.steps.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            // / 圆角
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text("#${index+1}"),
            ),
            title: Text(_meal.steps[index]),
          );
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
      ),
    );
  }

  // 公共方法
  Widget buildMakeTitle(BuildContext context ,String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Text(
        title,
        style: Theme.of(context).textTheme.display3.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }


  // 抽取Container
  Widget buildContentList({BuildContext context, Widget child}) {
    return Container(
      width: MediaQuery.of(context).size.width - 20.px,
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6.px),
      ),
      child: child,
    );
  }


}
