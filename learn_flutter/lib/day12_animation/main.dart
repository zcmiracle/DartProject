import 'package:flutter/material.dart';
import 'dart:math';
import 'pages/modal_page.dart';
import 'pages/image_detail.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animation",
      home: ZCHomePage(),
    );
  }
}

class ZCHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 9,
            childAspectRatio: 16/9,
          ),
          children: List.generate(20, (index) {
            final imageURL = "https://picsum.photos/500/500?random=$index";
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (ctx, animation1, animation2) {
                    return FadeTransition(opacity: animation1, child:
                    ZCImageDetailPage(imageURL),);
                  }
                ));
              },
              child: Hero(
                tag: imageURL,
                child: Image.network(
                  imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.pool),
        onPressed: () {
//          Navigator.of(context).push(
//            MaterialPageRoute(
//              builder: (ctx) {
//                return ZCModalPage();
//              },
//                /// iOS modal的形式从底部弹出
//              fullscreenDialog: true
//            ),
//          );
          Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: Duration(seconds: 3),
            pageBuilder: (ctx, animation1, animation2) {
              return FadeTransition(
                opacity: animation1,
                child: ZCModalPage(),
              );
            }
          ));

        },
      ),
    );
  }
}


