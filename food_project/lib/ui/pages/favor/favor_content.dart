import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/viewmodel/favor_view_model.dart';
import '../../widgets/meal_item.dart';

class ZCFavorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZCFavorViewModel>(
      builder: (ctx, favorVM, child) {
        if (favorVM.meals.length == 0) {
          return Center(
            child: Text("未收藏美食"),
          );
        }

        return ListView.builder(
          itemCount: favorVM.meals.length,
          itemBuilder: (itemContext, index) {
            return ZCMealItem(favorVM.meals[index]);
          },
        );
      },
    );
  }
}
