import 'package:flutter/material.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud_upload, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // later: pick image/video
              },
              icon: const Icon(Icons.add),
              label: const Text("Select File"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // later: upload to server
              },
              child: const Text("Upload"),
            ),
          ],
        ),
      ),
    );
  }
}
