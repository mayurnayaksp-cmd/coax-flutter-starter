import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Profile info row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Avatar
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.redAccent,
                    child: Text("U", style: TextStyle(fontSize: 28, color: Colors.white)),
                  ),

                  // Stats
                  Column(
                    children: const [
                      Text("10", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Posts", style: TextStyle(color: Colors.white54)),
                    ],
                  ),
                  Column(
                    children: const [
                      Text("250", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Followers", style: TextStyle(color: Colors.white54)),
                    ],
                  ),
                  Column(
                    children: const [
                      Text("180", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Following", style: TextStyle(color: Colors.white54)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Username + bio
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("User Name", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("🔥 Just a sample bio here!", style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                      onPressed: () {},
                      child: const Text("Edit Profile"),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Post grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[800],
                  child: const Icon(Icons.image, color: Colors.white54),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
