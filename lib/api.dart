import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Class representing a User
class User {
  final int id;
  final String name;
  final String email;
  final Map<String, dynamic> address;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
  });
// Factory method to convert JSON data to a User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
    );
  }
}

// UserProvider class to manage the list of users
class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;
  // Function to fetch users' data asynchronously
  Future<void> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _users = data.map((user) => User.fromJson(user)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
