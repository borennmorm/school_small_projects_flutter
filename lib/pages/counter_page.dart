import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('តម្លើងបន្ថយ'),
        backgroundColor: Colors.grey[200],
        centerTitle: true,
      ),
      body: Text("Coming Soon"),
    );
  }
}
