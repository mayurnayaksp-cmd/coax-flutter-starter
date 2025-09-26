import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coax Home"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings later
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Settings tapped")),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          "Welcome to Coax 🚀",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
