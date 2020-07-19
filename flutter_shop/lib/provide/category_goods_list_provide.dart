import 'package:flutter/material.dart';
import '../model/category/category_goods_list_model.dart';

// 分类商品列表数据
class CategoryGoodsListProvider with ChangeNotifier {

  List<CategoryListData> goodsList = [];
  getGoodsList(List<CategoryListData> list) {
    goodsList = list;
    notifyListeners();
  }

  // 分类上拉加载列表数据
  addGoodsList(List<CategoryListData> list) {
    goodsList.addAll(list);
    notifyListeners();
  }

}