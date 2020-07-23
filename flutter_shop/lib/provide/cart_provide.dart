import 'package:flutter/material.dart';
import '../model/cart/cart_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/// 购物车Provide
class CartProvide with ChangeNotifier {

  // 保存的json数据
  String cartString = "[]";

  // 商品列表对象
  List<CartInfoModel> cartList = [];
  // 总价格
  double allPrice = 0;
  // 商品总数
  int allGoodsCount = 0;
  // 是否全选
  bool isAllCheck = true;

  /// 1、保存商品数据
  save(goodsId, goodsName, count, price, images) async {

    // 初始化SharedPreferences
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // 获取持久化存储的值
    cartString = preferences.getString('cartInfo');

    var temp = cartString == null ? [] : json.decode(cartString.toString());
    // 将获取到的值转变为List
    List<Map> tempList = (temp as List).cast();
    // 声明变量，判断购物车中是否已经存在此商品ID
    // 默认没有
    var isHave = false;
    // 用于进行循环的索引使用
    var index = 0;
    allPrice = 0;
    allGoodsCount = 0;
    
    for (var item in tempList) {
      if (item['goodsId'] == goodsId) {
        tempList[index]['count'] = item['count'] + 1;
        cartList[index].count++;
        isHave = true;
      }
      if (item['isCheck']) {
        //算出总价
        allPrice += (cartList[index].price * cartList[index].count);
        //算出总的商品数量
        allGoodsCount += cartList[index].count;
      }
      index++;
    }

    if (!isHave) {
      Map<String, dynamic> newGoods = {
        'goodsId' : goodsId,
        'goodsName' : goodsName,
        'count' : count,
        'price' : price,
        'images' : images,
        'isCheck' : true,
      };

      tempList.add(newGoods);
      cartList.add(new CartInfoModel.fromJson(newGoods));
      allPrice += (count * price);
      allGoodsCount += count;
    }

    cartString = json.encode(tempList).toString();
    // 保存
    preferences.setString('cartInfo', cartString);
    notifyListeners();
  }


  /// 2、取出购物车的商品
  getCartInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    cartString = preferences.getString('cartInfo');

    // 把cartList进行初始化，防止数据混乱
    cartList = [];
    if (cartString == null) {
      cartList = [];
    } else {
      // ******
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      allPrice = 0;
      allGoodsCount = 0;
      // 初始化全选为true
      isAllCheck = true;

      tempList.forEach((itemM) {
        // 是否为全选判断
        if (itemM['isCheck']) {
          allPrice += (itemM['count'] * itemM['price']);
          allGoodsCount += itemM['count'];
        } else {
          isAllCheck = false;
        }
        cartList.add(CartInfoModel.fromJson(itemM));
      });
    }
    notifyListeners();
  }


  /// 3、修改复选框选中状态
  changeCheckState(CartInfoModel cartItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((item){
      if(item['goodsId'] == cartItem.goodsId){
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList[changeIndex] = cartItem.toJson();
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }

  /// 4、删除单个购物车商品
  deleteOneGoods(String goodsId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    cartString = preferences.getString("cartInfo");
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    int tempIndex = 0;
    int deleteIndex = 0;
    tempList.forEach((itemM) {
      if (itemM['goodsId'] == goodsId) {
        deleteIndex = tempIndex;
      }
      tempIndex ++;
    });
    tempList.removeAt(deleteIndex);
    cartString = json.encode(tempList).toString();
    preferences.setString('cartInfo', cartString);
    // 得到数据刷新处理
    await getCartInfo();
  }

  /// 5、增加 or 减少数量的操作
  addOrDecreaseAction(CartInfoModel cartItem, String todo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    cartString = preferences.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((itemM) {
      if(itemM['goodsId'] == cartItem.goodsId){
        changeIndex = tempIndex;
      }
      tempIndex ++;
    });

    if (todo == 'add') {
      cartItem.count ++;
    } else if (cartItem.count > 1) {
      cartItem.count --;
    }

    tempList[changeIndex] = cartItem.toJson();
    cartString = json.encode(tempList).toString();
    preferences.setString('cartInfo', cartString);
    await getCartInfo();
  }

  /// 6、全选状态处理
  changeAllCheckButtonState(bool isCheck) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    List<Map> newList = [];
    for(var item in tempList){
      var newItem = item;
      newItem['isCheck'] = isCheck;
      newList.add(newItem);
    }

    cartString = json.encode(newList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }

}