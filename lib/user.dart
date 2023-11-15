import 'package:brainwired/api.dart';
import 'package:brainwired/userdetails.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<List<dynamic>> _userData;

  @override
  void initState() {
    super.initState();
    _userData = fetchData();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 166, 185, 195),
      title: const Text('User List'),
    ),
    body: FutureBuilder<List<dynamic>>(
      future: _userData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While data is being fetched, show a loading indicator
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var user = snapshot.data![index];
              return Column(
                children: [
                  ListTile(
                    title: Text(user['name']),
                    subtitle: Text(user['email']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailsScreen(user: user),
                        ),
                      );
                    },
                  ),
                  const Divider(
                    height: 1, // Adjust the height of the divider as needed
                    color: Colors.grey, // You can set the color of the divider
                    thickness: 1, // Set the thickness of the divider
                  ),
                ],
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error fetching data'),
          );
        }
        return Container(); // Return an empty container by default
      },
    ),
  );
}

}
