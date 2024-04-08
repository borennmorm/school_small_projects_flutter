import 'package:flutter/material.dart';

class UserRandom extends StatefulWidget {
  const UserRandom({super.key});

  @override
  State<UserRandom> createState() => _UserRandomState();
}

class _UserRandomState extends State<UserRandom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('អ្នកប្រើប្រាស់'),
        backgroundColor: Colors.grey[200],
      ),
      body: Center(child: Text("Coming soon")),
    );
  }
}
