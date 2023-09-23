import 'package:tarea1/expression_parser.dart';
//import 'package:tarea1/fraction/fraction.dart';
void main() {
  String expression = "[1/6]*6+[2/3]*3/2+1";
  num result = evaluateMathExpression(expression);
  print("Result: $result");
}