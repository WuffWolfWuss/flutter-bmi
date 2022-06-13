import 'package:flutter/material.dart';
import './constant_values.dart';

class BottomButtion extends StatelessWidget {

  BottomButtion(this.bottomNumberContent, {required this.onTap});

  final VoidCallback? onTap;
  final String bottomNumberContent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Center(child: Text(bottomNumberContent, style: dTextBigbutton)),
        color: dBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity, //stretch out
        height: dBottomContainerHeight,
      ),
    );
  }
}