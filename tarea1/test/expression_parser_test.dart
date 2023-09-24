import 'package:test/test.dart';
import 'package:tarea1/fraction/src/fraction.dart';
import 'package:tarea1/expression_parser.dart';

void main() {
  group('Integer tests', () {
    test('Addition of Integers', () {
      expect(evaluateMathExpression("5+3"), equals(8.0));
    });

    test('Mixed Operators with Integers', () {
      expect(evaluateMathExpression("7*4-2/2"), equals(27.0));
    });
  });

  group('Integers with Parentheses', () {
    test('Addition with Parentheses', () {
      expect(evaluateMathExpression("4*(2+3)"), equals(20.0));
    });

    test('Mixed Operators with Parentheses', () {
      expect(evaluateMathExpression("(8-2)/(3+1)"), equals(1.5));
    });
  });

  group('Doubles tests', () {
    test('Multiplication of Doubles', () {
      expect(evaluateMathExpression("3.5*2.0"), equals(7.0));
    });

    test('Division of Doubles', () {
      expect(evaluateMathExpression("10.0/2.5"), equals(4.0));
    });
  });

  group('Doubles with Parentheses', () {
    test('Subtraction with Parentheses', () {
      expect(evaluateMathExpression("(5.5-3.0)*2.0"), equals(5.0));
    });

    test('Mixed Operators with Parentheses', () {
      expect(evaluateMathExpression("(7.2*2.5)/(4.0+0.8)"), equals(3.75));
    });
  });

  group('Fractions tests', () {
    test('Multiplication of Fractions', () {
      expect(evaluateMathExpressionReturnFraction("[1/3]*[2/5]"), equals(Fraction(2, 15)));
    });

    test('Division of Fractions', () {
      expect(evaluateMathExpressionReturnFraction("[3/4]/[1/2]"), equals(Fraction(3, 2)));
    });
  });

  group('Fractions with Parentheses', () {
    test('Addition with Parentheses', () {
      expect(evaluateMathExpressionReturnFraction("[1/2]+([1/4]+[1/8])"), equals(Fraction(7, 8)));
    });

    test('Mixed Operators with Parentheses', () {
      expect(evaluateMathExpressionReturnFraction("([1/3]*2)/([1/4]+[1/8])"), equals(Fraction(16, 9)));
    });
  });

  group('Integers and Doubles (No Parentheses)', () {
    test('Mixed Integers and Doubles', () {
      expect(evaluateMathExpression("5+2.5*3"), equals(12.5));
    });

    test('Mixed Integers and Doubles', () {
      expect(evaluateMathExpression("10/2+3.5"), equals(8.5));
    });
  });

  group('Integers and Fractions (With Parentheses)', () {
    test('Mixed Integers and Fractions with Parentheses', () {
      expect(evaluateMathExpression("(3+[1/4])*2"), equals(6.5));
    });

    test('Mixed Integers and Fractions with Parentheses', () {
      expect(evaluateMathExpression("5-([1/3]+2)"), equals(2.6666666667));
    });
  });

  group('Doubles and Fractions (No Parentheses)', () {
    test('Mixed Doubles and Fractions', () {
      expect(evaluateMathExpression("2.5*[1/2]"), equals(1.25));
    });

    test('Mixed Doubles and Fractions', () {
      expect(evaluateMathExpression("3.0/[3/4]"), equals(4.0));
    });
  });
}
