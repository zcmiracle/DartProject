import 'package:flutter/material.dart';
import '../model/category/category_model.dart';

class CategoryProvider with ChangeNotifier {

  /// 二级分类列表
  List<SecondCategoryVO> secondCategoryList = [];
  /// 二级分类索引
  int secondCategoryIndex = 0;
  /// 一级分类索引
  int firstCategoryIndex = 0;
  /// 一级分类id
  String firstCategoryId = '4';
  /// 二级分类id
  String secondCategoryId = '';
  /// 列表页数，改变一级分类或者二级分类时进行改变
  int page = 1;
  String noMoreText = '';
  bool isNewCategory = true;


  /// 首页点击类别时更改类别
  changeFirstCategory(String id, int index){
    firstCategoryId = id;
    firstCategoryIndex = index;
    secondCategoryId = '';
    notifyListeners();
  }

  /// 改变二级分类索引
  changeSecondIndex(int index, String id) {
    isNewCategory = true;
    secondCategoryIndex = index;
    secondCategoryId = id;
    page = 1;
    noMoreText = '';
    notifyListeners();
  }

  /// 获取二级分类数据
  getSecondCategory(List<SecondCategoryVO> list, String id) {
    isNewCategory = true;
    firstCategoryId = id;
    secondCategoryIndex = 0;
    page = 1;
    /// 点击一级分类，将二级分类的id清空
    secondCategoryId = '';
    noMoreText = '';

    /// 当前一级分类下，所有二级分类清空
    SecondCategoryVO all = SecondCategoryVO();
    all.secondCategoryId = '';
    all.firstCategoryId = '00';
    all.secondCategoryName = '全部';
    all.comments = 'null';
    secondCategoryList = [all];
    secondCategoryList.addAll(list);
    notifyListeners();
  }

  /// 增加page页数
  addPage(){
    page++;
  }

  /// 改变noMoreText数据
  chageNoMore(String text){
    noMoreText = text;
    notifyListeners();
  }

  changeFale(){
    isNewCategory = false;
  }

}