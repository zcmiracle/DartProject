import 'package:flutter/material.dart';
import 'category_content.dart';
import '../../config/index.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ZCString.categoryTitle),), // 商品分类
      body: CategoryContent(),
    );
  }
}
