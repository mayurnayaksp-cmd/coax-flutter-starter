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
      title: 'Coax',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Coax 🚀'),
          backgroundColor: Colors.deepPurple,
        ),
        body: const Center(
          child: Text(
            'Hello Coax!',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
