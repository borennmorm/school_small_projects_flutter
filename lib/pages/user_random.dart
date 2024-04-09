import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserRandom extends StatefulWidget {
  const UserRandom({super.key});

  @override
  State<UserRandom> createState() => _UserRandomState();
}

class _UserRandomState extends State<UserRandom> {
  late Future<List<User>> _users;

  @override
  void initState() {
    super.initState();
    _users = fetchUsers();
  }

  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=50'));
    if (response.statusCode == 200) {
      final List<dynamic> results = jsonDecode(response.body)['results'];
      return results.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('អ្នកប្រើប្រាស់'),
        backgroundColor: Colors.grey[200],
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: _users,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.gender),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.picture),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserDetails(user: user)),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ព័ត៌មានលម្អិតអ្នកប្រើប្រាស់'),
        backgroundColor: Colors.grey[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.picture),
              radius: 50,
            ),
            const SizedBox(height: 20),
            Text('${user.firstName} ${user.lastName}'),
            const SizedBox(height: 10),
            Text('Gender: ${user.gender}'),
            const SizedBox(height: 10),
            Text('Email: ${user.email}'),
            const SizedBox(height: 10),
            Text('Date of Birth: ${user.dob}'),
          ],
        ),
      ),
    );
  }
}

class User {
  final String firstName;
  final String lastName;
  final String gender;
  final String picture;
  final String email;
  final String dob;

  User({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.picture,
    required this.email,
    required this.dob,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final dob = json['dob'];
    return User(
      firstName: name['first'],
      lastName: name['last'],
      gender: json['gender'],
      picture: json['picture']['large'],
      email: json['email'],
      dob: dob['date'],
    );
  }
}
