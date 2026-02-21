
// class CalculatorLogic{
//   double add(double a , double b){
//      return a+b;
//   }
//
//   double subtract(double a, double b){
//     return a-b;
//   }
//
//   double multiply(double a, double b){
//     return a*b;
//  }
//
//  double divide(double a, double b){
//     if(b==0)
//       return 0;
//     else return a/b;
//  }
//
// }

class CalculatorLogic {

  double add(double a, double b) {
    return a + b;
  }

  double subtract(double a, double b) {
    return a - b;
  }

  double multiply(double a, double b) {
    return a * b;
  }

  double percentage(double value) => value / 100;


  String formatResult(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    } else {
      return value.toString();
    }
  }

  double divide(double a, double b) {
    if (b == 0) {
      throw Exception("Cannot divide by zero");
    }
    return a / b;
  }
}

