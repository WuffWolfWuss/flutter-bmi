import 'dart:math';

class bmiCal {
  bmiCal({this.weight, this.height});

  final int? height;
  final int? weight;

  double _bmi = 0;

  String bmiCalText(){
    _bmi = weight!/pow(height!/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi >= 25){
      return 'Overweight';
    } else if (_bmi > 18.5){
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getDescription(){
    if (_bmi >= 25){
      return 'recommend exercise more! You have higher than normal body weight';
    } else if (_bmi > 18.5){
      return "You have normal body weight. Keep at it";
    } else {
      return "You should eat more. Your body weight is lower than normal";
    }
  }

}