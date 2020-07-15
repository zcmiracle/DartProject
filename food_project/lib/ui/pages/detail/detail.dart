import 'package:flutter/material.dart';
import '../../../core/model/meal_model.dart';
import '../../../core/viewmodel/favor_view_model.dart';
import 'detail_content.dart';
import 'package:provider/provider.dart';
import 'detail_floating_button.dart';

class ZCDetailScreen extends StatelessWidget {

  // 路由
  static const String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as ZCMealModel;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),),
      body: ZCDetailContent(meal),
      floatingActionButton: ZCDetailFloatingButton(meal),
    );
  }
}
