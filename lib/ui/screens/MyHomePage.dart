import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bmicalculator/models/calculate.dart';
import 'package:flutter_bmicalculator/ui/Utils/constants.dart';
import 'package:flutter_bmicalculator/ui/componant/UiWidjit.dart';
import 'package:flutter_bmicalculator/ui/componant/bottom_button.dart';
import 'package:flutter_bmicalculator/ui/componant/round_icon_button.dart';
import 'package:flutter_bmicalculator/ui/componant/usable_bg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ResultPage.dart';

enum Gender {
  male,
  female,
  other,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender selectedGender = Gender.other;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? kActiveColor
                        : kInActiveColor,
                    cardChild:
                        UiWidjit(FontAwesomeIcons.mars, "Male".toUpperCase()),
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  )),
                  Expanded(
                      child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kActiveColor
                        : kInActiveColor,
                    cardChild: UiWidjit(
                        FontAwesomeIcons.venus, "FeMale".toUpperCase()),
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  )),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              colour: kInActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height".toUpperCase(),
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text(
                        "cm".toUpperCase(),
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              onPressed: () {
                //print("i got click");
              },
            )),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: ReusableCard(
                    colour: kInActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight".toUpperCase(),
                          style: kTextStyle,
                        ),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              () {
                                setState(() {
                                  weight++;
                                });
                              },
                              FontAwesomeIcons.plus,
                            ),
                            SizedBox(
                              width: 21.0,
                            ),
                            RoundIconButton(
                              () {
                                setState(() {
                                  weight--;
                                });
                              },
                              FontAwesomeIcons.minus,
                            ),
                          ],
                        )
                      ],
                    ),
                    onPressed: () {
                      //print("i got click");
                    },
                  )),
                  Expanded(
                      child: ReusableCard(
                    colour: kInActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age".toUpperCase(),
                          style: kTextStyle,
                        ),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              () {
                                setState(() {
                                  age++;
                                });
                              },
                              FontAwesomeIcons.plus,
                            ),
                            SizedBox(
                              width: 21.0,
                            ),
                            RoundIconButton(
                              () {
                                setState(() {
                                  if (age != 1) {
                                    age--;
                                  }
                                });
                              },
                              FontAwesomeIcons.minus,
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPressed: () {
                      print("i got click");
                    },
                  )),
                ],
              ),
            ),
            BottomButton(() {
              Calculate calc = Calculate(weight.toDouble(), height.toDouble());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    calc.calculateBMI(),
                    calc.getResults(),
                    calc.getInterpretation(),
                  ),
                ),
              );
            }, "Calculate Your BMI")
          ],
        ));
  }
}
