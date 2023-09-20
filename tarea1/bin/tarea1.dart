import 'package:tarea1/fraction/fraction.dart';
void main(List<String> arguments) {
 // Ejemplos de uso
  final fraction1 = Fraction(5, 10);
  print(fraction1.toString()); // Output: 1/2

  final fraction2 = Fraction.fromJson({'numerator': 3, 'denominator': 9});
  print(fraction2.toString()); // Output: 1/3

  final fraction3 = Fraction.fromString("4/8");
  print(fraction3.toString()); // Output: 1/2

  final fraction4 = Fraction.fromDouble(0.75);
  print(fraction4.toString()); // Output: 3/4

  final fraction5 = Fraction.fromBigInt(BigInt.parse('11111111111111111111111111111111111111111111111'),
  BigInt.parse('99999999999999999999999999999999999999999999999'));
  print(fraction5.toString());
}
