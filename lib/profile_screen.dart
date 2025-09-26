import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile picture + stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.orangeAccent,
                  backgroundImage: NetworkImage(
                    "https://picsum.photos/200", // dummy profile pic
                  ),
                ),
                Column(
                  children: const [
                    Text("120",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("Posts"),
                  ],
                ),
                Column(
                  children: const [
                    Text("2.5K",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("Followers"),
                  ],
                ),
                Column(
                  children: const [
                    Text("340",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text("Following"),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 15),

            // Username + bio
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("CX_User",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 5),
                    Text("🔥 Welcome to Coax! Made in India 🇮🇳"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Buttons (Edit Profile / Share)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Edit Profile"),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Share Profile"),
                ),
              ],
            ),

            const Divider(height: 30),

            // Grid of posts
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: 12, // dummy posts
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/id/$index/200"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
