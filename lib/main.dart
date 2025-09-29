import 'package:flutter/material.dart';

void main() {
  runApp(const CoaxApp());
}

class CoaxApp extends StatelessWidget {
  const CoaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COAX',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to COAX 🚀"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "This is your custom COAX Home Page!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
