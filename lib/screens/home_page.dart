import 'package:flutter/material.dart';

import '../components/page_buttons.dart';
import '../pages/calculator_page.dart';
import '../pages/car_number_guesing.dart';
import '../pages/equation_solver.dart';
import '../pages/home_number_guessing.dart';
import '../pages/phone_number_guessing.dart';
import '../pages/user_random.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('លំហាត់'),
        backgroundColor: Colors.grey[300],
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Search",
                labelStyle: const TextStyle(color: Colors.grey),
                hintText: "Search by page title...",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.grey.shade400)),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              children: _getPageButtons(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getPageButtons() {
    // Create a list of PageButtons
    return [
      PageButton(
        imagePath: 'assets/images/smartphone.png',
        pageTitle: 'ទាយលេខទូរស័ព្ទ',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PhoneNumberGuessing(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/math.png',
        pageTitle: 'សមីការដឺក្រេទី២',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EquationSolver(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/home.png',
        pageTitle: 'ទាយលេខផ្ទះ',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeNumberGuessing(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/car-registration.png',
        pageTitle: 'ទាយលេខឡាន',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CarNumberGuessing(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/calculator.png',
        pageTitle: 'មាស៊ីនគិតលេខ',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CalculatorPage(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/group.png',
        pageTitle: 'អ្នកប្រើប្រាស់',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserRandom(),
            ),
          );
        },
      ),
    ].where((button) => button.pageTitle.contains(_searchText)).toList();
  }
}
