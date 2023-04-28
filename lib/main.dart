import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0xFFEB1555),
                          thumbColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                        ),
          
          appBarTheme: AppBarTheme(
            shadowColor: Color.fromARGB(255, 0, 0, 0),
            backgroundColor: Color(0xFF090C22),
            ),
            
        ),
      home: const InputPage(title: 'BMI Calculator'),
    );
  }
}




