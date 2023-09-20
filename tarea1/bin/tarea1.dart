import 'package:tarea1/fraction/fraction.dart';
void main(List<String> arguments) {
 // Ejemplos de uso
  final fraction1 = Fraction(5, 10);
  final fraction12 = Fraction(5, 10);
  print(fraction1==fraction12); // Output: 1/2

  final fraction2 = Fraction.fromJson({'numerator': 3, 'denominator': 9});
  print(fraction2.toString()); // Output: 1/3
  print(fraction2.toNum());
  fraction2.setPrecision(9);
  print(fraction2.toNum());
  print(fraction2.isProper());
  print(fraction2.isImproper());

  final fraction3 = Fraction.fromString("4/8");
  print(fraction3.toString()); // Output: 1/2

  final fraction4 = Fraction.fromDouble(0.75);
  print(fraction4.toString()); // Output: 3/4
  print(fraction4.toNum());

}
