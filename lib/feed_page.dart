import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: 5, // shows 5 dummy posts
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: profile pic + username
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text("U", style: TextStyle(color: Colors.white)),
                ),
                title: Text(
                  "User $index",
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "2 hrs ago",
                  style: TextStyle(color: Colors.white54),
                ),
                trailing: const Icon(Icons.more_vert, color: Colors.white),
              ),

              // Post image placeholder
              Container(
                height: 250,
                color: Colors.grey[800],
                child: const Center(
                  child: Icon(Icons.image, color: Colors.white54, size: 80),
                ),
              ),

              // Action buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: const [
                    Icon(Icons.favorite_border, color: Colors.white, size: 28),
                    SizedBox(width: 16),
                    Icon(Icons.comment_outlined, color: Colors.white, size: 28),
                    SizedBox(width: 16),
                    Icon(Icons.share_outlined, color: Colors.white, size: 28),
                  ],
                ),
              ),

              // Caption
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "This is a sample caption for the post. 🔥",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
