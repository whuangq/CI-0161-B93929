import 'package:tarea1/fraction/src/fraction.dart';
import 'package:test/test.dart';

void main() {
  group('Fraction tests', () {
    test('Fraction constructor should correctly create a valid Fraction', () {
      // Arrange: Create a valid numerator and denominator
      final numerator = 3;
      final denominator = 4;

      // Act: Create a Fraction object using the constructor
      final fraction = Fraction(numerator, denominator);

      // Assert: Check that the Fraction object was created correctly
      expect(fraction.numerator, numerator);
      expect(fraction.denominator, denominator);
    });

    test('Fraction constructor should throw ArgumentError for denominator zero', () {
      // Arrange: Create a numerator and a denominator of zero
      final numerator = 0;
      final denominator = 0;

      // Act and Assert: Expect an ArgumentError to be thrown
      expect(() => Fraction(numerator, denominator), throwsA(isA<ArgumentError>()));
    });

    test('Fraction constructor should simplify fractions', () {
      // Arrange: Create a numerator and a denominator that require simplification
      final numerator = 6;
      final denominator = 12;

      // Act: Create a Fraction object using the constructor
      final fraction = Fraction(numerator, denominator);

      // Assert: Check that the Fraction object was created correctly and simplified
      expect(fraction.numerator, 1);
      expect(fraction.denominator, 2);
    });

    test('Fraction.fromDouble should correctly convert a valid double', () {
      // Arrange: Create a valid double
      final validDouble = 0.75;

      // Act: Convert the double into a Fraction object
      final fraction = Fraction.fromDouble(validDouble);

      // Assert: Check that the Fraction object was created correctly
      expect(fraction.numerator, 3);
      expect(fraction.denominator, 4);
    });

    test('Fraction.fromDouble should correctly handle whole numbers', () {
      // Arrange: Create a whole number double
      final wholeNumberDouble = 5.0;

      // Act: Convert the double into a Fraction object
      final fraction = Fraction.fromDouble(wholeNumberDouble);

      // Assert: Check that the Fraction object represents a whole number
      expect(fraction.numerator, 5);
      expect(fraction.denominator, 1);
    });

    test('Fraction.fromDouble should correctly handle small decimals', () {
      // Arrange: Create a small decimal double
      final smallDecimalDouble = 0.00123;

      // Act: Convert the double into a Fraction object
      final fraction = Fraction.fromDouble(smallDecimalDouble);

      // Assert: Check that the Fraction object represents the decimal with precision
      expect(fraction.numerator, 123);
      expect(fraction.denominator, 100000);
    });
    test('Fraction.fromString should correctly parse a valid string', () {
      // Arrange: Create a valid string
      final validString = '3/4';

      // Act: Parse the string into a Fraction object
      final fraction = Fraction.fromString(validString);

      // Assert: Check that the Fraction object was created correctly
      expect(fraction.numerator, 3);
      expect(fraction.denominator, 4);
    });

    test('Fraction.fromString should throw FormatException for an invalid format', () {
      // Arrange: Create a string with an invalid format (missing '/')
      final invalidFormatString = '3';

      // Act and Assert: Expect a FormatException to be thrown
      expect(() => Fraction.fromString(invalidFormatString), throwsA(isA<FormatException>()));
    });

    test('Fraction.fromString should throw ArgumentError for denominator zero', () {
      // Arrange: Create a string with a denominator of zero
      final zeroDenominatorString = '3/0';

      // Act and Assert: Expect an ArgumentError to be thrown
      expect(() => Fraction.fromString(zeroDenominatorString), throwsA(isA<ArgumentError>()));
    });

      test('Fraction.fromJson should correctly parse valid JSON', () {
      // Arrange: Create a valid JSON object
      final validJson = {'numerator': 3, 'denominator': 4};

      // Act: Deserialize the JSON into a Fraction object
      final fraction = Fraction.fromJson(validJson);

      // Assert: Check that the Fraction object was created correctly
      expect(fraction.numerator, 3);
      expect(fraction.denominator, 4);
    });

    test('Fraction.fromJson should throw FormatException for missing fields', () {
      // Arrange: Create JSON with a missing 'denominator' field
      final jsonMissingDenominator = {'numerator': 3};

      // Act and Assert: Expect a FormatException to be thrown
      expect(() => Fraction.fromJson(jsonMissingDenominator), throwsA(isA<FormatException>()));
    });

    test('Fraction.fromJson should throw ArgumentError for denominator zero', () {
      // Arrange: Create JSON with a denominator of zero
      final jsonDenominatorZero = {'numerator': 3, 'denominator': 0};

      // Act and Assert: Expect an ArgumentError to be thrown
      expect(() => Fraction.fromJson(jsonDenominatorZero), throwsA(isA<ArgumentError>()));
    });

    test('toString should return a string in the expected format for a simple fraction', () {
      final fraction = Fraction(3, 4);
      final result = fraction.toString();
      expect(result, equals('[3/4]'));
    });

    test('toString should return a string in the expected format for a whole number', () {
      final fraction = Fraction(5, 1);
      final result = fraction.toString();
      expect(result, equals('[5/1]'));
    });

    test('toString should return a string in the expected format for an improper fraction', () {
      final fraction = Fraction(9, 6);
      final result = fraction.toString();
      expect(result, equals('[3/2]'));
    });

    test('toNum should correctly convert a simple fraction to a double', () {
      final fraction = Fraction(3, 4);
      fraction.setPrecision(2);
      final result = fraction.toNum();
      expect(result, closeTo(0.75, 0.01));
    });

    test('toNum should correctly convert a whole number to a double', () {
      final fraction = Fraction(5, 1);
      fraction.setPrecision(2);
      final result = fraction.toNum();
      expect(result, closeTo(5.0, 0.01));
    });

    test('toNum should correctly convert an improper fraction to a double', () {
      final fraction = Fraction(9, 6);
      fraction.setPrecision(2);
      final result = fraction.toNum();
      expect(result, closeTo(1.5, 0.01));
    });

    test('toInt should correctly convert a simple fraction to an integer', () {
      final fraction = Fraction(3, 4);
      final result = fraction.toInt();
      expect(result, equals(0));
    });

    test('toInt should correctly convert a whole number to an integer', () {
      final fraction = Fraction(5, 1);
      final result = fraction.toInt();
      expect(result, equals(5));
    });

    test('toInt should correctly convert an improper fraction to an integer', () {
      final fraction = Fraction(9, 6);
      final result = fraction.toInt();
      expect(result, equals(1));
    });

    test('Operator + should correctly add two fractions with the same denominator', () {
      final fraction1 = Fraction(1, 4);
      final fraction2 = Fraction(3, 4);
      final result = fraction1 + fraction2;
      expect(result.numerator, equals(1));
      expect(result.denominator, equals(1));
    });

    test('Operator + should correctly add two fractions with different denominators', () {
      final fraction1 = Fraction(1, 3);
      final fraction2 = Fraction(1, 4);
      final result = fraction1 + fraction2;
      expect(result.numerator, equals(7));
      expect(result.denominator, equals(12));
    });

    test('Operator + should return a simplified fraction', () {
      final fraction1 = Fraction(1, 2);
      final fraction2 = Fraction(1, 3);
      final result = fraction1 + fraction2;
      expect(result.numerator, equals(5));
      expect(result.denominator, equals(6));
    });

    test('Operator - should correctly subtract two fractions with the same denominator', () {
      final fraction1 = Fraction(1, 4);
      final fraction2 = Fraction(3, 4);
      final result = fraction1 - fraction2;
      expect(result.numerator, equals(-1));
      expect(result.denominator, equals(2));
    });

    test('Operator - should correctly subtract two fractions with different denominators', () {
      final fraction1 = Fraction(5, 6);
      final fraction2 = Fraction(1, 3);
      final result = fraction1 - fraction2;
      expect(result.numerator, equals(1));
      expect(result.denominator, equals(2));
    });

    test('Operator - should return a simplified fraction', () {
      final fraction1 = Fraction(7, 8);
      final fraction2 = Fraction(1, 2);
      final result = fraction1 - fraction2;
      expect(result.numerator, equals(3));
      expect(result.denominator, equals(8));
    });

    test('Operator * should correctly multiply two fractions', () {
      final fraction1 = Fraction(3, 4);
      final fraction2 = Fraction(1, 2);
      final result = fraction1 * fraction2;
      expect(result.numerator, equals(3));
      expect(result.denominator, equals(8));
    });

    test('Operator * should correctly multiply two fractions with whole numbers', () {
      final fraction1 = Fraction(5, 1);
      final fraction2 = Fraction(2, 3);
      final result = fraction1 * fraction2;
      expect(result.numerator, equals(10));
      expect(result.denominator, equals(3));
    });

    test('Operator * should return a simplified fraction', () {
      final fraction1 = Fraction(2, 5);
      final fraction2 = Fraction(3, 7);
      final result = fraction1 * fraction2;
      expect(result.numerator, equals(6));
      expect(result.denominator, equals(35));
    });

    test('should correctly divide two fractions', () {
      final fraction1 = Fraction(3, 4);
      final fraction2 = Fraction(1, 2);
      final result = fraction1 / fraction2;
      expect(result.numerator, equals(3));
      expect(result.denominator, equals(2));
    });

    test('should correctly divide two fractions with whole numbers', () {
      final fraction1 = Fraction(5, 1);
      final fraction2 = Fraction(2, 3);
      final result = fraction1 / fraction2;
      expect(result.numerator, equals(15));
      expect(result.denominator, equals(2));
    });

    test('should throw an exception when dividing by zero', () {
      final fraction1 = Fraction(2, 5);
      final fraction2 = Fraction(0, 1);
      expect(() => fraction1 / fraction2, throwsException);
    });

    test('should correctly compare two fractions where the first is less', () {
      final fraction1 = Fraction(1, 4);
      final fraction2 = Fraction(3, 4);
      final result = fraction1 < fraction2;
      expect(result, isTrue);
    });

    test('should correctly compare two fractions where the second is less', () {
      final fraction1 = Fraction(3, 4);
      final fraction2 = Fraction(1, 2);
      final result = fraction1 < fraction2;
      expect(result, isFalse);
    });

    test('should return false when comparing equal fractions', () {
      final fraction1 = Fraction(2, 3);
      final fraction2 = Fraction(2, 3);
      final result = fraction1 < fraction2;
      expect(result, isFalse);
    });

    test('Operator <= should correctly compare two fractions where the first is less', () {
      final fraction1 = Fraction(1, 4);
      final fraction2 = Fraction(3, 4);
      final result = fraction1 <= fraction2;
      expect(result, isTrue);
    });

    test('Operator <= should correctly compare two fractions where the second is less', () {
      final fraction1 = Fraction(3, 4);
      final fraction2 = Fraction(1, 2);
      final result = fraction1 <= fraction2;
      expect(result, isFalse);
    });

    test('Operator <= should return true when comparing equal fractions', () {
      final fraction1 = Fraction(2, 3);
      final fraction2 = Fraction(2, 3);
      final result = fraction1 <= fraction2;
      expect(result, isTrue);
    });

    test('Operator == should correctly compare two equal fractions', () {
      final fraction1 = Fraction(2, 3);
      final fraction2 = Fraction(2, 3);
      final result = fraction1 == fraction2;
      expect(result, isTrue);
    });

    test('Operator == should return false for two different fractions', () {
      final fraction1 = Fraction(3, 4);
      final fraction2 = Fraction(1, 2);
      final result = fraction1 == fraction2;
      expect(result, isFalse);
    });

    test('Operator == should return true for the same fraction instances', () {
      final fraction1 = Fraction(1, 4);
      final result = fraction1 == fraction1;
      expect(result, isTrue);
    });

    test('Operator >= should correctly compare two fractions where the first is greater', () {
      final fraction1 = Fraction(3, 4);
      final fraction2 = Fraction(1, 4);
      final result = fraction1 >= fraction2;
      expect(result, isTrue);
    });

    test('Operator >= should correctly compare two fractions where the second is greater', () {
      final fraction1 = Fraction(1, 2);
      final fraction2 = Fraction(3, 4);
      final result = fraction1 >= fraction2;
      expect(result, isFalse);
    });

    test('Operator >= should return true when comparing equal fractions', () {
      final fraction1 = Fraction(2, 3);
      final fraction2 = Fraction(2, 3);
      final result = fraction1 >= fraction2;
      expect(result, isTrue);
    });

    test('Operator > should correctly compare two fractions where the first is greater', () {
      final fraction1 = Fraction(3, 4);
      final fraction2 = Fraction(1, 4);
      final result = fraction1 > fraction2;
      expect(result, isTrue);
    });

    test('Operator > should correctly compare two fractions where the second is greater', () {
      final fraction1 = Fraction(1, 2);
      final fraction2 = Fraction(3, 4);
      final result = fraction1 > fraction2;
      expect(result, isFalse);
    });

    test('Operator > should return false when comparing equal fractions', () {
      final fraction1 = Fraction(2, 3);
      final fraction2 = Fraction(2, 3);
      final result = fraction1 > fraction2;
      expect(result, isFalse);
    });

    test('power should correctly raise a fraction to a positive exponent', () {
      final fraction = Fraction(2, 3);
      final result = fraction.power(3);
      expect(result.numerator, equals(8));
      expect(result.denominator, equals(27));
    });

    test('power should return 1 when raising a fraction to the exponent of 0', () {
      final fraction = Fraction(3, 4);
      final result = fraction.power(0);
      expect(result.numerator, equals(1));
      expect(result.denominator, equals(1));
    });

    test('power should correctly handle negative exponents', () {
      final fraction = Fraction(4, 5);
      final result = fraction.power(-2);
      expect(result.numerator, equals(25));
      expect(result.denominator, equals(16));
    });

    test('isProper should return true for a proper fraction', () {
      final fraction = Fraction(2, 3);
      final result = fraction.isProper();
      expect(result, isTrue);
    });

    test('isProper should return false for an improper fraction', () {
      final fraction = Fraction(4, 3);
      final result = fraction.isProper();
      expect(result, isFalse);
    });

    test('isProper should return false for a whole number', () {
      final fraction = Fraction(5, 1);
      final result = fraction.isProper();
      expect(result, isFalse);
    });

    test('isImproper should return false for a proper fraction', () {
      final fraction = Fraction(2, 3);
      final result = fraction.isImproper();
      expect(result, isFalse);
    });

    test('isImproper should return true for an improper fraction', () {
      final fraction = Fraction(4, 3);
      final result = fraction.isImproper();
      expect(result, isTrue);
    });

    test('isImproper should return true for a whole number', () {
      final fraction = Fraction(5, 1);
      final result = fraction.isImproper();
      expect(result, isTrue);
    });

    test('isWhole should return true for a whole number', () {
      final fraction = Fraction(5, 1);
      final result = fraction.isWhole();
      expect(result, isTrue);
    });

    test('isWhole should return false for a proper fraction', () {
      final fraction = Fraction(2, 3);
      final result = fraction.isWhole();
      expect(result, isFalse);
    });

    test('isWhole should return false for an improper fraction', () {
      final fraction = Fraction(4, 3);
      final result = fraction.isWhole();
      expect(result, isFalse);
    });

    test('toFraction should convert an integer to a fraction with denominator 1', () {
      final integer = 5;
      final fraction = integer.toFraction();
      expect(fraction.numerator, equals(5));
      expect(fraction.denominator, equals(1));
    });

    test('toFraction should convert zero to a fraction with denominator 1', () {
      final integer = 0;
      final fraction = integer.toFraction();
      expect(fraction.numerator, equals(0));
      expect(fraction.denominator, equals(1));
    });

    test('toFraction should convert a negative integer to a fraction with denominator 1', () {
      final integer = -3;
      final fraction = integer.toFraction();
      expect(fraction.numerator, equals(-3));
      expect(fraction.denominator, equals(1));
    });

    test('toFraction should correctly convert a simple decimal to a fraction', () {
      final decimal = 0.75;
      final fraction = decimal.toFraction();
      expect(fraction.numerator, equals(3));
      expect(fraction.denominator, equals(4));
    });

    test('toFraction should correctly convert a whole number to a fraction', () {
      final decimal = 5.0;
      final fraction = decimal.toFraction();
      expect(fraction.numerator, equals(5));
      expect(fraction.denominator, equals(1));
    });

    test('toFraction should correctly convert a negative decimal to a fraction', () {
      final decimal = -0.625;
      final fraction = decimal.toFraction();
      expect(fraction.numerator, equals(-5));
      expect(fraction.denominator, equals(8));
    });

    test('toFraction should correctly convert a valid fraction string', () {
      final fractionString = '3/4';
      final fraction = fractionString.toFraction();
      expect(fraction.numerator, equals(3));
      expect(fraction.denominator, equals(4));
    });

    test('toFraction should throw an exception for an invalid fraction string', () {
      final invalidFractionString = 'invalid';
      expect(() => invalidFractionString.toFraction(), throwsFormatException);
    });

    test('toFraction should throw an exception for a string with a zero denominator', () {
      final zeroDenominatorString = '2/0';
      expect(() => zeroDenominatorString.toFraction(), throwsArgumentError);
    });
  });
}
