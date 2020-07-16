import 'package:flutter/material.dart';

class ShoppingCarPage extends StatefulWidget {
  @override
  _ShoppingCarPageState createState() => _ShoppingCarPageState();
}

class _ShoppingCarPageState extends State<ShoppingCarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("购物车"),),
      body: Center(),
    );
  }
}
