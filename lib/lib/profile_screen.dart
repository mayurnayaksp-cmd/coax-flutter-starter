import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://via.placeholder.com/150", // replace with real profile pic later
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Username",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            "user@email.com",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              // Navigate to settings later
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              // Logout logic later
            },
          ),
        ],
      ),
    );
  }
}
