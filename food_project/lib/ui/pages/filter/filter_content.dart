import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/extension/int_extension.dart';
import '../../../core/viewmodel/filter_view_model.dart';


class ZCFilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildChoiceTitle(context),
        buildChoiceSelect(),
      ],
    );
  }

  Widget buildChoiceTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text("展示你的选择", style: Theme.of(context).textTheme.display3
          .copyWith(fontWeight: FontWeight.bold),),
    );
  }

  Widget buildChoiceSelect() {
    return Expanded(
      child: Consumer<ZCFilterViewModel>(
        builder: (ctx, filterVM, child) {
          return ListView(
            /// 计算大小
            shrinkWrap: true,
            children: <Widget>[
              buildListTile("无谷蛋白", "无谷蛋白", filterVM.isGlutenFree, (value) {
                filterVM.isGlutenFree = value;
              }),
              buildListTile("不含乳糖", "不含乳糖", filterVM.isLactoseFree, (value) {
                filterVM.isLactoseFree = value;
              }),
              buildListTile("普通素食主义", "普通素食主义", filterVM.isVegetarian, (value) {
                filterVM.isVegetarian = value;
              }),
              buildListTile("严格素食主义", "严格素食主义", filterVM.isVegan, (value) {
                filterVM.isVegan = value;
              }),
            ],
          );
        },
      ),
    );
  }

  Widget buildListTile(String title, String subtitle, bool value, Function
  onChange) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(value: value, onChanged: onChange),
    );
  }
}
