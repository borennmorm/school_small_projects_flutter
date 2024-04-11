// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/page_buttons.dart';
import '../pages/bmi_page.dart';
import '../pages/calculator_page.dart';
import '../pages/car_number_guesing.dart';
import '../pages/counter_page.dart';
import '../pages/equation_solver.dart';
import '../pages/home_number_guessing.dart';
import '../pages/phone_number_guessing.dart';
import '../pages/user_random.dart';
import '../pages/weather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  final String url =
      'https://github.com/borinmorm21/school_small_projects_flutter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('លំហាត់'),
          backgroundColor: Colors.grey[300],
          actions: [
            GestureDetector(
              onTap: () {
                _launchTelegram();
              },
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(
                  'assets/images/telegram.png',
                ),
              ),
            ),
            SizedBox(width: 16),
          ],
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
                padding: const EdgeInsets.only(
                    left: 30, right: 30, bottom: 30, top: 10),
                children: _getPageButtons(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            launchURL(url);
            print(url);
          },
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey[800],
          child: const FaIcon(FontAwesomeIcons.github),
        ));
  }

  // Function to launch URL
  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static _launchTelegram() async {
    const url = 'https://t.me/aboutbenro';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
        imagePath: 'assets/images/cloudy.png',
        pageTitle: 'អាកាសធាតុ',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WeatherPage(),
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
      PageButton(
        imagePath: 'assets/images/counter.png',
        pageTitle: 'តម្លើងបន្ថយ',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CounterPage(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/calculator.png',
        pageTitle: 'ម៉ាស៊ីនគិតលេខ',
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
        imagePath: 'assets/images/bmi.png',
        pageTitle: 'ពិនិត្យទម្ងន់',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BMIPage(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/check-list.png',
        pageTitle: 'ត្រូវធ្វើ',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CounterPage(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/exchange.png',
        pageTitle: 'ប្តូររូបិយបណ្ណ',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CounterPage(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/time-management.png',
        pageTitle: 'កំណត់ពេលវេលា',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CounterPage(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/flashlight.png',
        pageTitle: 'បិទបើកពិល',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CounterPage(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/tic-tac-toe.png',
        pageTitle: 'លេងក្រ័រ',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CounterPage(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/quiz.png',
        pageTitle: 'សំណួរផ្សេងៗ',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CounterPage(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/budget.png',
        pageTitle: 'តាមដានចំណាយ',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CounterPage(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/notepad.png',
        pageTitle: 'កត់ត្រា',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CounterPage(),
            ),
          );
        },
      ),
      PageButton(
        imagePath: 'assets/images/notepad.png',
        pageTitle: 'កត់ត្រា',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CounterPage(),
            ),
          );
        },
      ),
    ].where((button) => button.pageTitle.contains(_searchText)).toList();
  }
}
