import 'package:flutter/material.dart';

void main() {
  runApp(CoaxApp());
}

class CoaxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coax Flutter Starter',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LikePage(),
    );
  }
}

class LikePage extends StatefulWidget {
  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  int likes = 0;

  void increaseLikes() {
    setState(() {
      likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coax Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Likes ❤️",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              "$likes",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increaseLikes,
        child: Icon(Icons.favorite),
      ),
    );
  }
}
