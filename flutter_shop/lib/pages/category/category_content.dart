import 'package:flutter/material.dart';
import '../../config/index.dart';
import '../../service/http_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:convert';
import '../../model/category/category_model.dart';

import 'category_content_left_nav.dart';
import 'category_content_right_page.dart';
import 'category_content_right_nav.dart';

class CategoryContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          CategoryContentLeftNav(),
          Column(
            children: <Widget>[
              CategoryContentRightNav(),
              CategoryContentRightPage(),
            ],
          )
        ],
      ),
    );
  }


}





