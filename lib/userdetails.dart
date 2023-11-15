
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  final dynamic user;

  // ignore: use_super_parameters
  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 166, 185, 195),
        elevation: 0, // Remove the app bar shadow
        title: Text(
          user['name'],
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: 200,
        width: 400,
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ID: ${user['id']}',
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Address:',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '${user['address']['street']}, ${user['address']['suite']}, ${user['address']['city']}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Email: ${user['email']}',
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 79, 87, 92),
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Add more styled user details as needed
            ],
          ),
        ),
      ),
    );
  }
}
