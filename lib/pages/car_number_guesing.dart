import 'package:flutter/material.dart';

import '../data/car_guessing_data.dart';

class CarNumberGuessing extends StatefulWidget {
  const CarNumberGuessing({super.key});

  @override
  State<CarNumberGuessing> createState() => _CarNumberGuessingState();
}

class _CarNumberGuessingState extends State<CarNumberGuessing> {
  final TextEditingController _controller = TextEditingController();
  String? result = "";
  String? errorText = "";

  void carNumberFn() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        int i = int.parse(_controller.text) % 9;
        result = carData[i];
        errorText = "";
      } else {
        errorText = "សូមបញ្ជូលលេខទូរស័ព្ទ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ទាយលេខឡាន'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/car-registration.png',
                width: 70,
              ),
              const SizedBox(height: 10),
              Text(
                "លេខឡាន",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.all(16),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade700),
                    ),
                    errorText: errorText!.isNotEmpty ? errorText : null,
                    labelStyle: const TextStyle(color: Colors.grey),
                    labelText: "បញ្ចូលលេខឡាន",
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: carNumberFn,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 224, 42, 97),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text("ទាយ"),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: Text(result!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
