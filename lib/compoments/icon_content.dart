import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './constant_values.dart';

class reuseChildContainer extends StatelessWidget {
  const reuseChildContainer(this.containerIcon, this.content);

  final IconData containerIcon;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(containerIcon, size: 80.0, color: dFontColor,),
        SizedBox(height: 15.0,),
        Text(content, style: dTextStl
          ,),]
      ,);
  }
}