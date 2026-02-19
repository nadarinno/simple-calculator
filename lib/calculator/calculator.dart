import 'package:flutter/material.dart';
import 'package:simple_calculator/logic/calculator_logic.dart';

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final CalculatorLogic logic = CalculatorLogic();

  String input1 = '';
  String input2 = '';
  String operator = '';
  String result = '';

  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        input1 = '';
        input2 = '';
        operator = '';
        result = '';
      } else if (value == 'DEL') {
        if (operator.isEmpty && input1.isNotEmpty) {
          input1 = input1.substring(0, input1.length - 1);
        } else if (operator.isNotEmpty && input2.isNotEmpty) {
          input2 = input2.substring(0, input2.length - 1);
        }
      } else if (value == '+' || value == '-' || value == '×' || value == '÷') {
        operator = value;
      } else if (value == '=') {
        double num1 = double.tryParse(input1) ?? 0;
        double num2 = double.tryParse(input2) ?? 0;

        switch (operator) {
          case '+':
            result = logic.add(num1, num2).toString();
            break;
          case '-':
            result = logic.subtract(num1, num2).toString();
            break;
          case '×':
            result = logic.multiply(num1, num2).toString();
            break;
          case '÷':
            result = logic.divide(num1, num2).toString();
            break;
        }
      } else if (value == '.') {
        if (operator.isEmpty && !input1.contains('.')) {
          input1 += '.';
        } else if (operator.isNotEmpty && !input2.contains('.')) {
          input2 += '.';
        }
      } else {
        if (operator.isEmpty) {
          input1 += value;
        } else {
          input2 += value;
        }
      }
    });
  }

  Widget buildButton(String text) {
    Color bgColor;
    Color textColor = Colors.white;

    if (text == 'C') {
      bgColor = Colors.redAccent;
    } else if (text == '=' || text == '+' || text == '-' || text == '×' || text == '÷') {
      bgColor = Colors.orangeAccent;
    } else if (text == 'DEL') {
      bgColor = Colors.blueGrey;
    } else {
      bgColor = Colors.grey[850]!; // dark gray for numbers
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => buttonPressed(text),
          child: Text(
            text,
            style: TextStyle(fontSize: 22, color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Text(
                result.isEmpty ? '$input1 $operator $input2' : result,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('÷'),
                ]),
                Row(children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('×'),
                ]),
                Row(children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('-'),
                ]),
                Row(children: [
                  buildButton('C'),
                  buildButton('0'),
                  buildButton('.'),
                  buildButton('+'),
                ]),
                Row(children: [
                  buildButton('DEL'),
                  buildButton('='),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

