import 'package:flutter/material.dart';
import '../../core/extension/int_extension.dart';

class ZCOperationItem extends StatelessWidget {

  final Widget _icon;
  final String title;
  final Color textColor;

  ZCOperationItem(this._icon, this.title, {this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.px,
      padding: EdgeInsets.symmetric(vertical: 5.px),
//      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _icon,
          SizedBox(width: 3.px,),
          Text(title, style: TextStyle(color: textColor),),
        ],
      ),
    );
  }
}
