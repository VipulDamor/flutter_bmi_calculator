import 'package:flutter/material.dart';
import 'package:flutter_bmicalculator/ui/Utils/constants.dart';
import 'package:flutter_bmicalculator/ui/componant/bottom_button.dart';
import 'package:flutter_bmicalculator/ui/componant/usable_bg.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage(this.bmiResult, this.resultText, this.interpretation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Expanded(
              flex: 0,
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                colour: kInActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Text(
                        resultText.toString(),
                        textAlign: TextAlign.center,
                        style: kResultTextStyle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        bmiResult.toString(),
                        style: kBMITextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        interpretation.toString(),
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                onPressed: () {}),
          ),
          BottomButton(() {
            Navigator.pop(context);
          }, "Calculate Again")
        ],
      ),
    );
  }
}
