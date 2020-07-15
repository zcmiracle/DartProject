import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/viewmodel/favor_view_model.dart';
import '../../widgets/meal_item.dart';

class ZCFavorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZCFavorViewModel>(
      builder: (ctx, favorVM, child) {

        if (favorVM.favorMeals.length == 0) {
          return Center(
            child: Text("未收藏美食"),
          );
        }

        return ListView.builder(
          itemCount: favorVM.favorMeals.length,
          itemBuilder: (itemContext, index) {
            return ZCMealItem(favorVM.favorMeals[index]);
          },
        );
      },
    );
  }
}
