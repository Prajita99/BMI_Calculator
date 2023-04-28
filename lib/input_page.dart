import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
// import 'dart:math' as math;


enum Gender {
    male,
    female
  }

class InputPage extends StatefulWidget {
  const InputPage({super.key, required this.title});

  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender ?selectedGender;
  double height = 5.0;
  int weight = 60;
  int age = 21;

  void Increment() {
    weight++;
  }

  void Decrement() {
    weight--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF100F1D),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male ? kActiveCardColor:kInactiveCardColor,
                  cardChild: iconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female ? kActiveCardColor:kInactiveCardColor,
                cardChild: iconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',),),
              ),
            ],
          ),),
          Expanded(
            child: ReusableCard(
              colour:kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT',
                      style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(), //.toString converts double to string
                          style: kNumberTextStyle,
                          ),
                          Text('feet',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme( //.of followed by .coptwith allows us to change some features of the widget
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29EB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                        ),
                        child: Slider(
                          value: height, 
                          min: 2.00,
                          max: 8.00,
                          // activeColor: Color(0xFFEB1555),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue;
                            });
                          }),
                      ),
                    ],
                  ),),
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',
                      style: kLabelTextStyle
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            }
                          ),
                          
                        ],
                      ),
                    ],
                  ),),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',
                      style: kLabelTextStyle
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            }
                          ),
                          
                        ],
                      ),
                    ],
                  ),),),
            ],
          ),),
          Container(
            color: kBottomContainerColor, //k naming convention for consts for easy searching
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity, //full width of screen
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({required this.icon,required this.onPressed});
  final IconData icon; 
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}




