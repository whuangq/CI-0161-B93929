import 'package:tarea1/fraction/src/fraction.dart';

class TreeNode {
  String value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}


List<String> tokenizeExpression(String expression) {
  List<String> operators = ['+', '-', '*', '/'];
  List<String> tokens = [];
  String currentToken = '';
  bool inFraction = false;

  for (int i = 0; i < expression.length; i++) {
    String char = expression[i];

    if (char == '[') {
      inFraction = true;
      currentToken += char;
    } else if (char == ']') {
      inFraction = false;
      currentToken += char;
      tokens.add(currentToken);
      currentToken = '';
    }else if ((operators.contains(char) || char == '(' || char == ')') && inFraction != true) {
      if (currentToken.isNotEmpty) {
        tokens.add(currentToken);
        currentToken = '';
      }
      tokens.add(char);
      inFraction = false; // Reset the fraction flag when encountering operators or parentheses.
    } else {
      if (inFraction) {
        currentToken += char;
      } else {
        if (currentToken.isNotEmpty) {
          tokens.add(currentToken);
          currentToken = '';
        }
        currentToken += char;
        if (i < expression.length - 1 && operators.contains(expression[i + 1])) {
          // If the next character is an operator, add the current token immediately.
          tokens.add(currentToken);
          currentToken = '';
        }
      }
    }
  }

  if (currentToken.isNotEmpty) {
    tokens.add(currentToken);
  }

  return tokens;
}

List<String> convertToRPN(List<String> tokens) {
  List<String> output = [];
  List<String> operatorStack = [];

  for (String token in tokens) {
    if (!isOperator(token) && token != '(' && token != ')') {
      output.add(token);
    } else if (isOperator(token)) {
      while (operatorStack.isNotEmpty &&
          isOperator(operatorStack.last) &&
          getPrecedence(operatorStack.last) >= getPrecedence(token)) {
        output.add(operatorStack.removeLast());
      }
      operatorStack.add(token);
    } else if (token == '(') {
      operatorStack.add(token);
    } else if (token == ')') {
      while (operatorStack.isNotEmpty && operatorStack.last != '(') {
        output.add(operatorStack.removeLast());
      }
      if (operatorStack.isNotEmpty && operatorStack.last == '(') {
        operatorStack.removeLast();
      } else {
        throw ArgumentError("Mismatched parentheses");
      }
    }
  }

  while (operatorStack.isNotEmpty) {
    if (operatorStack.last == '(' || operatorStack.last == ')') {
      throw ArgumentError("Mismatched parentheses");
    }
    output.add(operatorStack.removeLast());
  }

  return output;
}

TreeNode buildExpressionTree(List<String> rpnTokens) {
  List<TreeNode> stack = [];

  for (String token in rpnTokens) {
    if (!isOperator(token)) {
      // Check if the token is a fraction in square brackets
      if (token.startsWith('[') && token.endsWith(']')) {
        stack.add(TreeNode(token));
      } else {
        stack.add(TreeNode(token));
      }
    } else {
      TreeNode right = stack.removeLast();
      TreeNode left = stack.removeLast();
      TreeNode newNode = TreeNode(token);
      newNode.left = left;
      newNode.right = right;
      stack.add(newNode);
    }
  }

  if (stack.length != 1) {
    throw ArgumentError("Invalid expression");
  }

  return stack.first;
}

bool isOperator(String token) {
  return token == '+' || token == '-' || token == '*' || token == '/';
}

int getPrecedence(String operator) {
  switch (operator) {
    case '+':
    case '-':
      return 1;
    case '*':
    case '/':
      return 2;
    default:
      return 0;
  }
}

Fraction evaluateExpression(TreeNode? node) {
  if (node == null) {
    throw ArgumentError("Invalid expression");
  }

  if (node.left == null && node.right == null) {
    String value = node.value;
    late Fraction fraction;
    // Check if the value is a fraction in square brackets
    if (value.startsWith('[') && value.endsWith(']')) {
      value = value.substring(1, value.length - 1);
    }
    try{
      print(value);
      fraction = Fraction.fromString(value);
      return fraction;
    } catch (e) {
      throw Exception(e);
    }
  }

  Fraction leftValue = evaluateExpression(node.left);
  Fraction rightValue = evaluateExpression(node.right);

  switch (node.value) {
    case "+":
      print("$leftValue + $rightValue");
      return leftValue + rightValue;
    case "-":
    print("$leftValue - $rightValue");
      return leftValue - rightValue;
    case "*":
    print("$leftValue * $rightValue");
      return leftValue * rightValue;
    case "/":
    print("$leftValue / $rightValue");
      if (rightValue.denominator == 0) {
        throw ArgumentError("Division by zero");
      }
      return leftValue / rightValue;
    default:
      throw ArgumentError("Invalid operator: ${node.value}");
  }
}

num evaluateMathExpression(String expression) {
  List<String> tokens = tokenizeExpression(expression);
  List<String> rpnTokens = convertToRPN(tokens);
  TreeNode root = buildExpressionTree(rpnTokens);
  return evaluateExpression(root).toNum();
}
