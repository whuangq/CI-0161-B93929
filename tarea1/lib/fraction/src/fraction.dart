library utils;
import 'dart:math' as math;

class Fraction {
  late BigInt numerator;
  late BigInt denominator;
  int precision = 3;

//-------- CONSTRUCTORES --------//

  Fraction(int n, int d) {
    if (d == 0) {
      throw ArgumentError("The denominator cannot be zero.");
    }
    numerator = BigInt.from(n);
    denominator = BigInt.from(d);
    simplify();
  } 

  Fraction.fromDouble(double value) {
    final parts = value.toString().split('.');
    final decimals = parts.length > 1 ? parts[1] : '';
    final BigInt multiplier = BigInt.from(math.pow(10, decimals.length));
    numerator = (BigInt.from(value) * multiplier);
    denominator = multiplier;
    simplify();
  }

  Fraction.fromString(String value) {
    final parts = value.split('/');
    if (parts.length != 2) {
      throw FormatException('String does not represent a valid fraction: $value');
    }
    numerator = BigInt.parse(parts[0]);
    denominator = BigInt.parse(parts[1]);
    if (denominator == 0) {
      throw ArgumentError("Denominator cannot be zero");
    }
    simplify();
  }

  Fraction.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('numerator') || !json.containsKey('denominator')) {
      throw const FormatException('JSON object does not contain required fields.');
    }
    numerator = json["numerator"];
    denominator = json["denominator"];
    if (denominator == 0) {
      throw ArgumentError("Denominator cannot be zero");
    }
    simplify();
  }

  Fraction.fromBigInt(BigInt num, BigInt den) {
    numerator = num;
    denominator = den;
    if (denominator == 0) {
      throw ArgumentError("Denominator cannot be zero");
    }
    simplify();
  }
//-------- FUNCIONES ADICIONALES --------//
  // funcion para encontrar maximo comun divisor
  BigInt gcd(BigInt a, BigInt b) {
    while (b != 0) {
      final t = b;
      b = a % b;
      a = t;
    }
    return a;
  }

  void simplify() {
    final n = gcd(numerator, denominator);
    numerator ~/= n;
    denominator ~/= n;
  }

  @override
  String toString() {
    return "[$numerator/$denominator]";
  }

//-------- OVERRIDE DE OPERADORES --------//

  Fraction operator +(Fraction b) {
    final denominador = denominator * b.denominator;
    final nuevoNum = (numerator * b.denominator) + (b.numerator * denominator);
    return Fraction.fromBigInt(nuevoNum, denominador);
  }

  Fraction operator -(Fraction b) {
    final denominador = denominator * b.denominator;
    final nuevoNum = (numerator * b.denominator) - (b.numerator * denominator);
    return Fraction.fromBigInt(nuevoNum, denominador);
  }

  Fraction operator *(Fraction b) {
    return Fraction.fromBigInt(numerator * b.numerator, denominator * b.denominator);
  }

  Fraction operator /(Fraction b) {
    if (b.numerator == 0) {
      throw Exception("Cannot divide by zero.");
    }
    return Fraction.fromBigInt(numerator * b.denominator, denominator * b.numerator);
  }

  bool operator <(Fraction b) {
    return numerator * b.denominator < b.numerator * denominator;
  }

  bool operator <=(Fraction b) {
    return numerator * b.denominator <= b.numerator * denominator;
  }

  @override
  bool operator ==(Object b) {
    if (identical(this, b)) return true;
    return b is Fraction && numerator == b.numerator && denominator == b.denominator;
  }

  bool operator >=(Fraction b) {
    return numerator * b.denominator >= b.numerator * denominator;
  }

  bool operator >(Fraction b) {
    return numerator * b.denominator > b.numerator * denominator;
  }

}

//-------- EXTENSIONES DE INT, DOUBLE Y STRING --------//

extension IntExtensions on int {
  Fraction toFraction() {
    return Fraction(this, 1);
  }
}

extension DoubleExtensions on double {
  Fraction toFraction() {
    return Fraction.fromDouble(this);
  }
}

extension StringExtensions on String {
  Fraction toFraction() {
    return Fraction.fromString(this);
  }
}

