import 'package:brainwired/api.dart';
import 'package:brainwired/userdetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// UserListScreen displaying the list of users
class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    userProvider.fetchUsers(); // Fetch users when the screen initializes
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 166, 185, 195),
        title: const Text('User List'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          if (provider.users.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // Display the list of users using ListView
            return ListView.builder(
              itemCount: provider.users.length,
              itemBuilder: (context, index) {
                var user = provider.users[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      // onTap: () {
                      //    // Navigate to UserDetailsScreen when ListTile is tapped
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => UserDetailsScreen(user: user),
                      //     ),
                      //   );
                      // },
                      onTap: () {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: UserDetailsScreen(user: user),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    ),
  );
},
                    ),
                    const Divider(
                      height: 1,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
