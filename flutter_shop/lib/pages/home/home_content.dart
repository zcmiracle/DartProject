import 'package:flutter/material.dart';
import '../../config/index.dart';
import '../../service/http_service.dart';
import 'dart:convert';

class ZCHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        body: FutureBuilder(
          future: request('homePageContent', formData: null),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString());
              print(data);
              List<Map> swiperDataList = (data['data']['slides'] as List).cast();

            }
            return Container(
              child: Text('111111'),
            );
          },
        ),
      ),
    );
  }
}
