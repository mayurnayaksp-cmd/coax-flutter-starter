import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? _selectedFile;
  final TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload"),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Preview box
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: _selectedFile == null
                  ? const Center(child: Text("No file selected"))
                  : Center(child: Text("File selected: $_selectedFile")),
            ),
            const SizedBox(height: 16),

            // Caption field
            TextField(
              controller: _captionController,
              decoration: const InputDecoration(
                labelText: "Write a caption...",
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),

            // Select file button (dummy for now)
            ElevatedButton.icon(
              onPressed: () {
                // Later we'll integrate real image/video picker
                setState(() {
                  _selectedFile = "demo_image.png"; // placeholder
                });
              },
              icon: const Icon(Icons.upload_file),
              label: const Text("Choose Image/Video"),
            ),

            const SizedBox(height: 16),

            // Post button
            ElevatedButton(
              onPressed: () {
                if (_captionController.text.isEmpty || _selectedFile == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Add file and caption!")),
                  );
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Post uploaded (UI only)!")),
                );
              },
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
