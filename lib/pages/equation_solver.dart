// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EquationSolver extends StatefulWidget {
  const EquationSolver({super.key});

  @override
  State<EquationSolver> createState() => _EquationSolverState();
}

class _EquationSolverState extends State<EquationSolver> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  String? result = "";

  void EquationSolverFnc(double a, double b, double c) {
    double discriminant = pow(b, 2) - 4 * a * c;
    if (discriminant > 0) {
      // double roots
      double root1 = (-b + sqrt(discriminant)) / (2 * a);
      double root2 = (-b - sqrt(discriminant)) / (2 * a);
      print('Root 1: $root1, Root 2: $root2');

      setState(() {
        result = 'ឌីដឺមីណង់ធំជាងសូន្យ\nឬសទី 1: $root1 \nឬសទី 2: $root2';
      });
    } else if (discriminant == 0) {
      // 1 root
      double root = -b / (2 * a);
      print('Root: $root');
      setState(() {
        result = 'ឌីដឺមីណង់ស្មើសូន្យ\nឬស : $root';
      });
    } else {
      // 2 complex roots
      double realPart = -b / (2 * a);
      double imaginaryPart = sqrt(-discriminant) / (2 * a);
      print(
          'ឌីដឺមីណង់ស្មើសូន្យមានឬសជាចំនួនកំផ្លិច\nឬសទី 1: $realPart + ${imaginaryPart}i, ឬសទី 2: $realPart - ${imaginaryPart}i');
      setState(() {
        result =
            'ឌីដឺមីណង់ស្មើសូន្យមានឬសជាចំនួនកំផ្លិច\nឬសទី 1: $realPart + ${imaginaryPart}i, \nឬសទី 2: $realPart - ${imaginaryPart}i';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('សមីការដឺក្រេទី២'),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              'a² + bx + c = 0',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // a
                const Text('a:'),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                    controller: _aController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),

                // b
                const Text('b:'),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                    controller: _bController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),

                // c
                const Text('c:'),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                    controller: _cController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                EquationSolverFnc(
                    double.parse(_aController.text),
                    double.parse(_bController.text),
                    double.parse(_cController.text));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text("Solve"),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Result:"),
            Text(
              result!,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
