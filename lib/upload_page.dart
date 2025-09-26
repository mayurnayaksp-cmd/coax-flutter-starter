import 'package:flutter/material.dart';
import 'post_model.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController contentController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  void _submitPost() {
    if (contentController.text.trim().isEmpty) return;

    final newPost = Post(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userName: "You",
      userAvatar: "https://i.pravatar.cc/150?img=5",
      content: contentController.text.trim(),
      imageUrl: imageController.text.trim().isNotEmpty
          ? imageController.text.trim()
          : null,
      timestamp: DateTime.now(),
    );

    Navigator.pop(context, newPost); // send back to home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: contentController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "What's on your mind?",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                hintText: "Image URL (optional)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPost,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: const Text("Post"),
            ),
          ],
        ),
      ),
    );
  }
}
