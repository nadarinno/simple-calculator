import 'package:flutter/material.dart';
import 'package:simple_calculator/controller/calculator_controller.dart';

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final CalculatorController controller = CalculatorController();

  void onButtonPress(String value) {
    setState(() {
      controller.buttonPressed(value);
    });
  }

  Widget buildButton(String text,
      {Color bgColor = const Color(0xFF1E1E1E),
        Color textColor = Colors.white}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            padding: const EdgeInsets.symmetric(vertical: 22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: () => onButtonPress(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(24),
                child: Text(
                  controller.display,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ),


            Column(
              children: [

                Row(children: [
                  buildButton('C', bgColor: Colors.grey, textColor: Colors.black),
                  buildButton('%', bgColor: Colors.grey, textColor: Colors.black),
                  buildButton('DEL', bgColor: Colors.grey, textColor: Colors.black),
                  buildButton('÷', bgColor: Colors.orange),
                ]),

                Row(children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('×', bgColor: Colors.orange),
                ]),

                Row(children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('-', bgColor: Colors.orange),
                ]),

                Row(children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('+', bgColor: Colors.orange),
                ]),

                Row(children: [
                  buildButton('0'),
                  buildButton('.'),
                  buildButton('=', bgColor: Colors.orange),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}