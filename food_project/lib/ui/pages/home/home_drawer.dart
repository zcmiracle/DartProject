import 'package:flutter/material.dart';
import 'package:food_project/core/extension/int_extension.dart';
import '../filter/filter.dart';

class ZCHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 240,
      child: Drawer(
        child: Column(
          children: <Widget>[
            buildHeaderView(context),
            buildListTile(context, Icon(Icons.restaurant), "进餐", () {
              Navigator.of(context).pop(); /// 弹框消失
            }),
            buildListTile(context, Icon(Icons.settings), "过滤", (){
              Navigator.of(context).pushNamed(ZCFilterScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.px,
      color: Colors.orange,
      margin: EdgeInsets.only(bottom: 20.px),
      alignment: Alignment(0, 0.5),
            child: Text("开始动手", style: Theme.of(context).textTheme.bodyText2),
    );
  }

  Widget buildListTile(BuildContext context, Widget icon, String title, Function handler) {
    return ListTile(
      leading: icon,
            title: Text(title, style: Theme.of(context).textTheme.bodyText1),
      onTap: handler,
    );
  }


}
