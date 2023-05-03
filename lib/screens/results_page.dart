import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator_app/calculator_brain.dart';


class ResultsPage extends StatelessWidget {

  ResultsPage({required this.interpretation, required this.bmiResult, required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,),
            )
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                  style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextSTyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE',
          onTap: () {
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}