import 'dart:ffi';

import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late double firstNum, secondNum;
  late String textToDisplay = '', res, operation;

  void btnOnClick(String btnVal) {
    print(btnVal);
    switch (btnVal) {
      case 'C':
        setState(() {
          textToDisplay = '';
          firstNum = 0;
          secondNum = 0;
          res = '';
        });
        break;
      case 'AC':
        setState(() {
          textToDisplay = '';
          firstNum = 0;
          secondNum = 0;
          res = '';
          operation = '';
        });
        break;
      case '+/-':
        setState(() {
          if (textToDisplay.isNotEmpty) {
            if (textToDisplay[0] == '-') {
              textToDisplay = textToDisplay.substring(1);
            } else {
              textToDisplay = '-' + textToDisplay;
            }
          }
        });
        break;
      case '+':
      case '-':
      case 'X':
      case '/':
        setState(() {
          if (textToDisplay.isNotEmpty) {
            firstNum = double.parse(textToDisplay);
            operation = btnVal;
            textToDisplay += ' $operation ';
          }
        });
        break;
      case '=':
        setState(() {
          if (textToDisplay.isNotEmpty && operation.isNotEmpty) {
            List<String> parts = textToDisplay.split(' ');
            firstNum = double.parse(parts[0]);
            secondNum = double.parse(parts[2]);
            switch (operation) {
              case '+':
                res = (firstNum + secondNum).toString();
                break;
              case '-':
                res = (firstNum - secondNum).toString();
                break;
              case 'X':
                res = (firstNum * secondNum).toString();
                break;
              case '/':
                res = (firstNum / secondNum).toString();
                break;
            }
            textToDisplay = res;
            operation = '';
          }
        });
        break;
      case '<':
        setState(() {
          if (textToDisplay.isNotEmpty) {
            textToDisplay =
                textToDisplay.substring(0, textToDisplay.length - 1);
          }
        });
        break;
      case '.':
        setState(() {
          if (!textToDisplay.contains('.')) {
            textToDisplay += btnVal;
          }
        });
        break;
      default:
        setState(() {
          textToDisplay += btnVal;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('មាស៊ីនគិតលេខ'),
        backgroundColor: Colors.grey[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey.shade700)),
            child: Text(
              textToDisplay,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButtons(
                numberText: 'AC',
                TextSize: 15,
                backgroundColor: Colors.white,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: 'C',
                TextSize: 15,
                backgroundColor: Colors.white,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: '<',
                TextSize: 15,
                backgroundColor: Colors.grey,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: '/',
                TextSize: 15,
                backgroundColor: Colors.grey,
                callback: btnOnClick,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButtons(
                numberText: '9',
                TextSize: 20,
                backgroundColor: Colors.white,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: '8',
                TextSize: 15,
                backgroundColor: Colors.white,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: '7',
                TextSize: 20,
                backgroundColor: Colors.white,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: 'X',
                TextSize: 15,
                backgroundColor: Colors.grey,
                callback: btnOnClick,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButtons(
                numberText: '6',
                TextSize: 20,
                backgroundColor: Colors.white,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: '5',
                TextSize: 20,
                backgroundColor: Colors.white,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: '4',
                TextSize: 20,
                backgroundColor: Colors.white,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: '-',
                TextSize: 20,
                backgroundColor: Colors.grey,
                callback: btnOnClick,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButtons(
                numberText: '3',
                TextSize: 20,
                backgroundColor: Colors.white,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: '2',
                TextSize: 20,
                backgroundColor: Colors.white,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: '1',
                TextSize: 20,
                backgroundColor: Colors.white,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: '+',
                backgroundColor: Colors.grey,
                TextSize: 15,
                callback: btnOnClick,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButtons(
                numberText: '+/-',
                TextSize: 15,
                backgroundColor: Colors.white,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: '0',
                TextSize: 20,
                backgroundColor: Colors.white,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: '.',
                TextSize: 20,
                backgroundColor: Colors.white,
                callback: btnOnClick,
              ),
              CalculatorButtons(
                numberText: '=',
                TextSize: 15,
                backgroundColor: Colors.grey,
                callback: btnOnClick,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class CalculatorButtons extends StatelessWidget {
  final String numberText;
  final double TextSize;
  final Color backgroundColor;
  final Function(String)? callback;

  const CalculatorButtons(
      {super.key,
      required this.numberText,
      required this.TextSize,
      required this.backgroundColor,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: ElevatedButton(
          onPressed: () {
            if (callback != null) {
              callback!(numberText);
            }
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        color: Colors.grey.shade700,
                      )))),
          child: Text(
            numberText,
            style: TextStyle(color: Colors.grey.shade800, fontSize: TextSize),
          )),
    );
  }
}
