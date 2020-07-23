import 'package:flutter/material.dart';
import '../../config/index.dart';
import 'package:provider/provider.dart';
import 'cart_item.dart';
import 'cart_bottom.dart';
import '../../provide/cart_provide.dart';

class ShoppingCarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ZCString.cartPageTitle), //购物车
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, snapshot) {
          List cartList = Provider.of<CartProvide>(context, listen: false)
              .cartList;
          if (snapshot.hasData && cartList != null) {
            return Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    return CartItem(cartList[index],);
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: CartBottom(),
                ),
              ],
            );
          } else {
            return Text(ZCString.loading); //'加载中...'
          }
        },
      ),
    );
  }

  Future _getCartInfo(BuildContext context) async {
    await Provider.of<CartProvide>(context, listen: true).getCartInfo();
    return 'end';
  }

}

