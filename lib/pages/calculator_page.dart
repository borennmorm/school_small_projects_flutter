import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('មាស៊ីនគិតលេខ'),
        backgroundColor: Colors.grey[200],
      ),
      body: Center(child: Text("Coming soon")),
    );
  }
}
