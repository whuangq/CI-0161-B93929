import 'package:flutter/material.dart';
import 'package:calculator_app/expression_parser/src/expression_parser.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

enum Operations {sum, sub, mult, div}

class _CalculatorScreenState extends State<CalculatorScreen> {

  String smallScreen = '';
  String bigScreen = '0';

  late Operations oper;
  bool finalized = false;
  bool inParentheses = false;
  bool inFraction = false;
  
  num result = 0;

  void onPress(String text) {
    setState(() {
      if(finalized) {
        smallScreen = '';
        bigScreen = '0';
        finalized = false;
      }
      switch (text) {
        case 'AC':
          smallScreen = '';
          bigScreen = '0';
          break;
        case 'backspace':
          if (bigScreen == '0') break;
          if (bigScreen.length == 1) {
            bigScreen = '0';
          } else {
            bigScreen = bigScreen.substring(0, bigScreen.length - 1);
          }
          break;
        case '+':
          smallScreen += '$bigScreen +';
          bigScreen = '0';
          break;
        case '-':
          smallScreen += '$bigScreen -';
          bigScreen = '0';
          break;
        case '/':
          smallScreen += '$bigScreen /';
          bigScreen = '0';
          break;
        case '*':
          smallScreen += '$bigScreen *';
          bigScreen = '0';
          break;
        case '(':
          smallScreen += '$bigScreen *';
          bigScreen = '0';
          break;
        case '=':
          // USING EXPRESSION TREE
          smallScreen += bigScreen;
          result = evaluateMathExpression(smallScreen);
          bigScreen = '$result';
          finalized = true;     
        default:
          if (bigScreen == '0') {
            bigScreen = text;
          } else {
            bigScreen = bigScreen + text;
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
        title: const Text('B 9 3 9 2 9',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            decorationColor: Color.fromARGB(255, 255, 255, 255),
            decoration: TextDecoration.underline,
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
                fontWeight: FontWeight.w400
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
                      text: "AC",
                      backgroundColor: const Color.fromARGB(255, 255, 169, 64),
                      onPressed: () => onPress("AC"),
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
                    const CalculatorBtn(
                      text: "/",
                      backgroundColor: Color.fromARGB(255, 255, 169, 64),
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
                      text: "x",
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
                      text: "-",
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
                      text: "+",
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

  const CalculatorBtn({
    this.icon,
    this.text='',
    required this.backgroundColor,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPressed,
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