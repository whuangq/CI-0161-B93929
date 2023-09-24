import 'package:tarea1/expression_parser.dart';
import 'package:tarea1/fraction/src/fraction.dart';
//import 'package:tarea1/fraction/fraction.dart';
void main() {
  Fraction f = Fraction.fromString("3.5");
  print("Result: $f");
  String expression = "3.5*2.0";
  num result = evaluateMathExpression(expression);
  print("Result: $result");
}