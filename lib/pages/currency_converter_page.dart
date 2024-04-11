import 'package:flutter/material.dart';
import 'dart:math';
import '../components/my_button.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final reilController = TextEditingController();
  double? result;

  void convert() {
    setState(() {
      double? reil = double.tryParse(reilController.text);
      result = reil != null ? reil / 4000 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ប្តូររូបិយប័ណ្ណ'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/exchange.png',
              width: 60,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("រៀល ទៅ ដុល្លា"),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120, right: 120),
              child: TextField(
                  controller: reilController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'រៀល',
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              tittleButton: 'គណនា',
              onPressed: convert,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              result != null ? '\$${result.toString()}' : 'N/A',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
