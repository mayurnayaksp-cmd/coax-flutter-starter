import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? _imagePath; // placeholder for selected image
  final TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Image upload area
            GestureDetector(
              onTap: () {
                // later: integrate image picker
                setState(() {
                  _imagePath =
                      "https://picsum.photos/400/300"; // dummy image for now
                });
              },
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.redAccent, width: 2),
                ),
                child: _imagePath == null
                    ? const Center(
                        child: Text(
                          "Tap to select image/video",
                          style: TextStyle(color: Colors.black54),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(_imagePath!, fit: BoxFit.cover),
                      ),
              ),
            ),

            const SizedBox(height: 20),

            // Caption text field
            TextField(
              controller: _captionController,
              decoration: InputDecoration(
                hintText: "Write a caption...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.orange.shade50,
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 20),

            // Upload button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Post uploaded (dummy)!")),
                  );
                },
                icon: const Icon(Icons.cloud_upload),
                label: const Text(
                  "Upload",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
