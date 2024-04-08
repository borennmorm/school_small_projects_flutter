import 'package:flutter/material.dart';
import '../data/home_guessing_data.dart';

class HomeNumberGuessing extends StatefulWidget {
  const HomeNumberGuessing({super.key});

  @override
  _HomeNumberGuessingState createState() => _HomeNumberGuessingState();
}

class _HomeNumberGuessingState extends State<HomeNumberGuessing> {
  final TextEditingController _controller = TextEditingController();
  String? errorText = "";
  String? result = "";

  void guessHomeNumber() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        int i = int.parse(_controller.text) % 7;
        result = homeData[i];
        errorText = "";
      } else {
        errorText = "សូមបញ្ជូលលេខផ្ទះ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ទាយលេខផ្ទះ'),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/home.png',
                width: 70,
              ),
              const SizedBox(height: 10),
              Text(
                "លេខផ្ទះ",
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
                    labelText: "បញ្ចូលលេខផ្ទះ",
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: guessHomeNumber,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
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
