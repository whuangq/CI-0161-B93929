import 'package:tarea1/expression_parser.dart';
//import 'package:tarea1/fraction/fraction.dart';
void main() {
  String expression = "[30/90]+10";
  num result = evaluateMathExpression(expression);
  print("Result: $result");
}