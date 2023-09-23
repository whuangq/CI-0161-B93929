import 'package:tarea1/expression_parser.dart';
//import 'package:tarea1/fraction/fraction.dart';
void main() {
  String expression = "2*3+[1/6]*6+1+[1/6]*6";
  num result = evaluateMathExpression(expression);
  print("Result: $result");
}