import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:calculator_app/expression_parser/src/expression_parser.dart';
import 'package:calculator_app/fraction/src/fraction.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

enum Operations {sum, sub, mult, div}

class _CalculatorScreenState extends State<CalculatorScreen> {

  String smallScreen = '';
  String bigScreen = '0';
  bool finalized = false;
  num result = 0;

  bool inParentheses(String input) {
    int openParenthesesCount = 0;
    for (int i = 0; i < input.length; i++) {
      if (input[i] == '(') {
        openParenthesesCount++;
      } else if (input[i] == ')') {
        openParenthesesCount--;
      }
    }
    return openParenthesesCount != 0;
  }
  bool inFraction(String input) {
    int openParenthesesCount = 0;
    for (int i = 0; i < input.length; i++) {
      if (input[i] == '[') {
        openParenthesesCount++;
      } else if (input[i] == ']') {
        openParenthesesCount--;
      }
    }
    return openParenthesesCount != 0;
  }


  num solve(String input) {
    num res = 0;
    
    res = evaluateMathExpression(input);
    return res;
  }

  bool fraction = false;
  void onPress(String text) {
    setState(() {
      if(finalized) {
        smallScreen = '';
        bigScreen = '';
        finalized = false;
      }
      fraction = inFraction(smallScreen);
      switch (text) {
        case 'AC':
          smallScreen = '';
          bigScreen = '';
          break;
        case 'backspace':
          if (smallScreen.length <= 1) {
            smallScreen = '';
          } else {
            smallScreen = smallScreen.substring(0, smallScreen.length - 1);
          }
          break;
        case '+':
          if(fraction == false) {
            smallScreen += '+';
          }
          break;
        case '-':
          if(fraction == false) {
            smallScreen += '-';
          }
          break;
        case '/':
          smallScreen += '/';
          break;
        case '*':
          if(fraction == false) {
            smallScreen += '*';
          }
          break;
        case '(':
          if(fraction == false) {
            if (inParentheses(smallScreen)) {
              smallScreen += ')';
            }
            else {
              smallScreen += '(';
            }
          }
          break;
        case '[':
          if (inFraction(smallScreen)) {
            smallScreen += ']';
          }
          else {
            smallScreen += '[';
          }
          break;
        case '=':
          // USING EXPRESSION TREE
          if(inParentheses(smallScreen) || inFraction(smallScreen)){
            bigScreen = 'ERROR';
            finalized = true;
            break;
          }
          result = solve(smallScreen);
          bigScreen = '$result';
          finalized = true;     
        default:
          if (smallScreen == '') {
            smallScreen = text;
          } else {
            smallScreen += text;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('W I L S O N   H U A N G',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Color.fromARGB(0, 0, 0, 64),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15,),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.black,
            height: 40,
            width: double.infinity,
            child: Text(smallScreen,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w400,
                fontFeatures: [FontFeature.fractions()]
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.black,
            height: 100,
            width: double.infinity,
            child: Text(bigScreen,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 169, 64),
                fontSize: 70,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CalculatorBtn(
                      text: "^",
                      backgroundColor: const Color.fromARGB(255, 255, 169, 64),
                      onPressed: () => onPress("^"),
                    ),
                    CalculatorBtn(
                      text: "(  )",
                      backgroundColor: const Color.fromARGB(255, 255, 169, 64),
                       onPressed: () => onPress("(")
                    ),
                    CalculatorBtn(
                      text: "[  ]",
                      backgroundColor: const Color.fromARGB(255, 255, 169, 64),
                       onPressed: () => onPress("[")
                    )
                    ,
                    CalculatorBtn(
                      text: "/",
                      backgroundColor: const Color.fromARGB(255, 255, 169, 64),
                      onPressed: () => onPress("/")
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CalculatorBtn(
                      text: "7",
                      backgroundColor: Colors.white12,
                      onPressed: () => onPress("7"),
                    ),
                    CalculatorBtn(
                      text: "8",
                      backgroundColor: Colors.white12,
                      onPressed: () => onPress("8"),
                    ),
                    CalculatorBtn(
                      text: "9",
                      backgroundColor: Colors.white12,
                      onPressed: () => onPress("9"),
                    ),
                    CalculatorBtn(
                      icon: Icons.close,
                      backgroundColor: const Color.fromARGB(255, 255, 169, 64),
                      onPressed: () => onPress("*"),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CalculatorBtn(
                      text: "4",
                      backgroundColor: Colors.white12,
                      onPressed: () => onPress("4"),
                    ),
                    CalculatorBtn(
                      text: "5",
                      backgroundColor: Colors.white12,
                      onPressed: () => onPress("5"),
                    ),
                    CalculatorBtn(
                      text: "6",
                      backgroundColor: Colors.white12,
                      onPressed: () => onPress("6"),
                    ),
                    CalculatorBtn(
                      icon: Icons.remove,
                      backgroundColor: const Color.fromARGB(255, 255, 169, 64),
                      onPressed: () => onPress("-"),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CalculatorBtn(
                      text: "1",
                      backgroundColor: Colors.white12,
                      onPressed: () => onPress("1"),
                    ),
                    CalculatorBtn(
                      text: "2",
                      backgroundColor: Colors.white12,
                      onPressed: () => onPress("2"),
                    ),
                    CalculatorBtn(
                      text: "3",
                      backgroundColor: Colors.white12,
                      onPressed: () => onPress("3"),
                    ),
                    CalculatorBtn(
                      icon: Icons.add,
                      backgroundColor: Color.fromARGB(255, 255, 169, 64),
                      onPressed: () => onPress("+"),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CalculatorBtn(
                      text: ".",
                      backgroundColor: Colors.white12,
                      onPressed: () => onPress("."),
                    ),
                    CalculatorBtn(
                      text: "0",
                      backgroundColor: Colors.white12,
                      onPressed: () => onPress("0"),
                    ),
                    CalculatorBtn(
                      icon: Icons.backspace_rounded,
                      backgroundColor: Colors.white38,
                      onPressed: () => onPress("backspace"),
                      onHold: ()=> onPress('AC'),
                    )
                    ,
                    CalculatorBtn(
                      text: "=",
                      backgroundColor: Color.fromARGB(255, 255, 169, 64),
                      onPressed: () => onPress("="),
                    ),
                  ],
                ),
              ]
            ),
          ),
        ],
      )
    );
  }
}

class CalculatorBtn extends StatelessWidget {

  final IconData? icon;
  final String text;
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final VoidCallback? onHold;

  const CalculatorBtn({
    this.icon,
    this.text='',
    required this.backgroundColor,
    this.onPressed,
    this.onHold,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPressed,
      onLongPress: onHold,
      radius: 20,
      child: Container(
        height: 80,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: (icon != null)
        ? Icon(icon, size: 35, color: Colors.white)
        : Text(text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}