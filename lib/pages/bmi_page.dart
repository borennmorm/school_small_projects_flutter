import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  String? bmiResult = '';
  String? errorText = '';

  void bmiCal() {
    double height = double.parse(heightController.text);
    double heightInMeters = height / 100;
    double weight = double.parse(weightController.text);
    double bmi = weight / (heightInMeters * heightInMeters);
    setState(() {
      if (heightController.text.isNotEmpty ||
          weightController.text.isNotEmpty) {
        if (bmi <= 18.5) {
          bmiResult = 'ស្គម';
        } else if (bmi > 18.5 && bmi <= 24.9) {
          bmiResult = 'ធម្មតា';
        } else if (bmi > 25 && bmi <= 29.9) {
          bmiResult = 'ធាត់';
        } else {
          bmiResult = 'ធាត់ខ្លាំង';
        }
        errorText = '';
      } else if (height == 0) {
        bmiResult = 'កម្ពស់មិនអាចគ្មានតម្លៃបានទេ';
      } else if (weight == 0) {
        bmiResult = 'ទម្ងន់មិនអាចគ្មានតម្លៃបានទេ';
      } else {
        bmiResult = '';
        errorText = 'សូមបញ្ចូលកម្ពស់ និងទម្ងន់';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ថ្លឹងទម្ងន់'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/bmi.png',
                  width: 50,
                ),
                const SizedBox(height: 10),
                Text(
                  "ថ្លឹងទម្ងន់",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'កម្ពស់',
                        errorText: errorText!.isNotEmpty ? errorText : null)),
                const SizedBox(height: 10),
                TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'ទម្ងន់',
                        errorText: errorText!.isNotEmpty ? errorText : null)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: bmiCal,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'គណនា',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  bmiResult!,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
