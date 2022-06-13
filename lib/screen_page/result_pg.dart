import 'package:bmi_calculator/compoments/reuse_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/compoments/constant_values.dart';
import 'package:bmi_calculator/compoments/reuse_card.dart';
import 'package:bmi_calculator/compoments/bottomButton.dart';

class Result extends StatelessWidget {

  Result({required this.bmiText, required this.bmiDes, required this.bmiRel});

  final String bmiRel;
  final String bmiText;
  final String bmiDes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text("YOUR RESULT", style: dresultTiltle,),
          )),
          Expanded(
            flex: 5,
              child: reuseContainer(
                  defaultColor,
                containerChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(bmiRel.toLowerCase(), style: dresultText,),
                    Text(bmiText, style: dresultBMI,),
                    Text(bmiDes, style: dresultSmallText, textAlign: TextAlign.center),
                  ],
                ),
              )
          ),
          BottomButtion("Re-Calculate", onTap: (){Navigator.pop(context);})
        ],
      ),
    );
  }
}
