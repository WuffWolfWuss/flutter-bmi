import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../compoments/icon_content.dart';
import 'package:bmi_calculator/compoments/reuse_card.dart';
import 'package:bmi_calculator/compoments/constant_values.dart';
import 'package:bmi_calculator/screen_page/result_pg.dart';
import '../compoments/bottomButton.dart';
import 'package:bmi_calculator/bmi_calculate.dart';


enum Gender {male, female}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectGender;
  int height = 170;
  int weight = 40;
  int age = 20;

 //#####1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child: reuseContainer(
                  selectGender == Gender.male ? defaultColor : dInactiveColor,
                  containerChild: reuseChildContainer(FontAwesomeIcons.mars,'MALE'),
                  onPress: (){
                    setState((){
                      selectGender = Gender.male;
                    });
                  },
                ),),
              Expanded(child: reuseContainer(
                  selectGender == Gender.female ? defaultColor : dInactiveColor,
                  containerChild: reuseChildContainer(FontAwesomeIcons.venus,'FEMALE'),
                  onPress: (){
                    setState((){
                      selectGender = Gender.female;
                    });
                  },
              ),)
            ],
          )), //GENDER
          Expanded(child: reuseContainer(
            defaultColor,
            containerChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT', style: dTextStl,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: dNumberTextStl),
                    SizedBox(width: 10,),
                    Text("cm", style: dTextStl,),
                ],),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: dFontColor,
                    overlayColor: Color(0x50eb1555),
                    thumbColor: dBottomContainerColor,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120, max: 220,
                      onChanged: (newValue){
                        setState((){
                          height = newValue.round();
                        });
                      },
                  ),
                )
              ],
            ),
          ),), //HEIGHT
          Expanded(child: Row(
            children: [
              Expanded(
                child: reuseContainer(
                  defaultColor,
                  containerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: dTextStl,),
                      Text(weight.toString(), style: dNumberTextStl,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customButtom(
                            buttonIcon: FontAwesomeIcons.minus,
                            action: (){
                              setState((){
                                weight--;
                              });
                            },
                          ),
                          customButtom(
                            buttonIcon: FontAwesomeIcons.plus,
                            action: (){
                              setState((){
                                weight++;
                              });
                            },
                          )
                      ],)
                    ],
                  ),
                ),),
              Expanded(child: reuseContainer(
                  defaultColor,
                containerChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AGE', style: dTextStl,),
                    Text(age.toString(), style: dNumberTextStl,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customButtom(
                          buttonIcon: FontAwesomeIcons.minus,
                          action: (){
                            setState((){
                              age--;
                            });
                          },
                        ),
                        customButtom(
                          buttonIcon: FontAwesomeIcons.plus,
                          action: (){
                            setState((){
                              age++;
                            });
                          },
                        )
                      ],)
                  ],
                ),
              ),)
            ],
          )), //WEIGHT,AGE
          BottomButtion("CALCULATOR",
            onTap: (){
            bmiCal cal = bmiCal(weight: weight,height: height);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Result(
                    bmiText: cal.bmiCalText(),
                    bmiDes: cal.getDescription(),
                    bmiRel: cal.getResult(),
                  )));
            },
          )
        ],
      )
    );
  }
}


//MyowncircleButton
class customButtom extends StatelessWidget {
  const customButtom({@required this.buttonIcon, this.action});

  final IconData? buttonIcon;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 70, height: 56),
        shape: CircleBorder(),
        fillColor: dFontColor,
        child: Icon(buttonIcon, size: 30, color: Colors.white,),
        onPressed: action,
    );
  }
}

//####-1
// Color maleCardColor = inactiveColor;
// Color femaleCardColor = inactiveColor;
//
// void updateColor(Gender gen){
//   if (gen == Gender.male){
//     if (maleCardColor == inactiveColor){
//       maleCardColor = defaultColor;
//       femaleCardColor = inactiveColor;
//     } else {
//       maleCardColor = inactiveColor;
//     }
//   } else {
//     if (femaleCardColor == inactiveColor){
//       femaleCardColor = defaultColor;
//       maleCardColor = inactiveColor;
//     } else {
//       femaleCardColor = inactiveColor;
//     }
//   }
// }
