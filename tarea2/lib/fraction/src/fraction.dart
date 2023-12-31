library utils;
import 'dart:math' as math;

class Fraction {
  late int numerator;
  late int denominator;
  int precision = 10;

//-------- CONSTRUCTORES --------//

  Fraction(this.numerator, this.denominator) {
    if (denominator == 0) {
      throw ArgumentError("The denominator cannot be zero.");
    }
    simplify();
  } 

  Fraction.fromDouble(double value) {
    final parts = value.toString().split('.');
    final decimals = parts.length > 1 ? parts[1] : '';
    final multiplier = math.pow(10, decimals.length).toInt();
    numerator = (value * multiplier).toInt();
    denominator = multiplier;
    simplify();
  }

/*
  Fraction.fromString(String value) {
    final parts = value.split('/');
    numerator = num.parse(parts[0]).toInt();
    if (parts.length == 2) {
      if (parts[0].contains('.')) {
        Fraction tempNum = convertDouble(parts[0]);
        Fraction tempDen;
        if (parts[1].contains('.')) {
          tempDen = convertDouble(parts[1]);
        } else {
          tempDen = Fraction(num.parse(parts[1]).toInt(),1);
        }
        Fraction temp = tempNum / tempDen;
        numerator = temp.numerator;
        denominator = temp.denominator;
      } else {
        numerator = num.parse(parts[0]).toInt();
      }
    } else if (parts.length == 1){
      denominator = 1;
    }
    else {
      throw FormatException('String does not contain the correct format for a fraction');
    }
    
    if (denominator == 0) {
      throw ArgumentError("Denominator cannot be zero");
    }
    simplify();
  }
*/

Fraction.fromString(String value) {
    final parts = value.split('/');
    if (parts.length == 2) {
      Fraction tempNum;
      Fraction tempDen;
      // check if numerator is double
      if (parts[0].contains('.')) {
        // convert double to fraction
        tempNum = convertDouble(parts[0]);
      } else {
        // convert int to fraction
        tempNum = Fraction(num.parse(parts[0]).toInt(),1);
      }
      // check if denominator is double
      if(parts[1].contains('.')) {
        tempDen = convertDouble(parts[1]);
      } else {
        tempDen = Fraction(num.parse(parts[1]).toInt(),1);
      }
      // assign values
      Fraction temp = tempNum / tempDen;
      numerator = temp.numerator;
      denominator = temp.denominator;

    } else if (parts.length == 1){
      // check if value is double
      if (parts[0].contains('.')) {
        Fraction tempNum = convertDouble(parts[0]);
        Fraction tempDen = Fraction(1, 1);
        Fraction temp = tempNum / tempDen;
        numerator = temp.numerator;
        denominator = temp.denominator;
      } else {
        // value is an int
        numerator = num.parse(parts[0]).toInt();
        denominator = 1;
      }
    }
    else {
      throw FormatException('String does not contain the correct format for a fraction');
    }
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

//-------- FUNCIONES ADICIONALES --------//
  // funcion para encontrar maximo comun divisor
  int gcd(int a, int b) {
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

//-------- FUNCIONES DE CONVERSION --------//

  num toNum(){ 
    return double.parse((numerator/denominator).toStringAsFixed(precision));
  }

  int toInt() {
    return numerator~/denominator;
  }

  void setPrecision(int n) {
    precision = n;
  }

  Fraction convertDouble(String value) {
    int n,d;
    final parts = value.toString().split('.');
    final decimals = parts.length > 1 ? parts[1] : '';
    final multiplier = math.pow(10, decimals.length).toInt();
    n = (num.parse(value) * multiplier).toInt();
    d = multiplier;
    return Fraction(n,d);
  }

//-------- OVERRIDE DE OPERADORES --------//

  Fraction operator +(Fraction b) {
    final denominador = denominator * b.denominator;
    final nuevoNum = (numerator * b.denominator) + (b.numerator * denominator);
    return Fraction(nuevoNum, denominador);
  }

  Fraction operator -(Fraction b) {
    final denominador = denominator * b.denominator;
    final nuevoNum = (numerator * b.denominator) - (b.numerator * denominator);
    return Fraction(nuevoNum, denominador);
  }

  Fraction operator *(Fraction b) {
    return Fraction(numerator * b.numerator, denominator * b.denominator);
  }

  Fraction operator /(Fraction b) {
    if (b.numerator == 0) {
      throw Exception("Cannot divide by zero.");
    }
    return Fraction(numerator * b.denominator, denominator * b.numerator);
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

//-------- POW, PROPER, IMPROPER, WHOLE --------//

  /// exponential function
  Fraction power(int exponent) {
    if (exponent < 0) {
      return Fraction(math.pow(denominator,-exponent).toInt(), math.pow(numerator,-exponent).toInt());
    } else if (exponent == 0) {
      return Fraction(1, 1);
    } else {
      return Fraction(math.pow(numerator, exponent).toInt(), math.pow(denominator,exponent).toInt());
    }
  }

  // proper: numerator is bigger than denominator
  bool isProper () {
    return numerator.abs() < denominator ? true : false;
  } 

  // improper: denominator is bigger than numerator
   bool isImproper () {
    return !isProper();
  } 

  bool isWhole() {
    return numerator % denominator == 0;
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

