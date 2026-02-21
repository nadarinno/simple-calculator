import 'package:simple_calculator/logic/calculator_logic.dart';

class CalculatorController {
  final CalculatorLogic logic = CalculatorLogic();

  String input1 = '';
  String input2 = '';
  String operator = '';
  String result = '';
  bool isResultShown = false;

  void clearAll() {
    input1 = '';
    input2 = '';
    operator = '';
    result = '';
    isResultShown = false;
  }

  void buttonPressed(String value) {
    if (value == 'C') {
      clearAll();
    }

    else if (value == 'DEL') {
      if (operator.isEmpty && input1.isNotEmpty) {
        input1 = input1.substring(0, input1.length - 1);
      } else if (operator.isNotEmpty && input2.isNotEmpty) {
        input2 = input2.substring(0, input2.length - 1);
      }
    }

    else if (value == '%') {
      if (input1.isNotEmpty) {
        double num = double.parse(input1);
        result = logic.formatResult(logic.percentage(num));
        input1 = result;
        isResultShown = true;
      }
    }

    else if (value == '+' || value == '-' || value == '×' || value == '÷') {
      operator = value;
      isResultShown = false;
    }

    else if (value == '=') {
      double num1 = double.tryParse(input1) ?? 0;
      double num2 = double.tryParse(input2) ?? 0;

      try {
        double calcResult = 0;

        switch (operator) {
          case '+':
            calcResult = logic.add(num1, num2);
            break;
          case '-':
            calcResult = logic.subtract(num1, num2);
            break;
          case '×':
            calcResult = logic.multiply(num1, num2);
            break;
          case '÷':
            calcResult = logic.divide(num1, num2);
            break;
        }

        result = logic.formatResult(calcResult);
        input1 = result;
        input2 = '';
        operator = '';
        isResultShown = true;

      } catch (e) {
        result = "Error";
        isResultShown = true;
      }
    }

    else if (value == '.') {
      if (operator.isEmpty && !input1.contains('.')) {
        input1 += '.';
      } else if (operator.isNotEmpty && !input2.contains('.')) {
        input2 += '.';
      }
    }

    else {
      if (isResultShown) {
        input1 = value;
        input2 = '';
        operator = '';
        result = '';
        isResultShown = false;
        return;
      }

      if (operator.isEmpty) {
        input1 += value;
      } else {
        input2 += value;
      }
    }
  }

  String get display {
    return result.isEmpty
        ? '$input1 $operator $input2'
        : result;
  }
}