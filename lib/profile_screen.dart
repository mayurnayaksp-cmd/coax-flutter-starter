import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Top expandable cover
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text("Profile"),
            background: Image.network(
              "https://picsum.photos/600/400?blur=2",
              fit: BoxFit.cover,
            ),
          ),
        ),

        // User info section
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("https://picsum.photos/200"),
              ),
              const SizedBox(height: 12),
              const Text(
                "Coax User",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text("@coax_user"),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 12),
                ),
                child: const Text("Edit Profile",
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),

        // Posts grid
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => Image.network(
              "https://picsum.photos/300?random=$index",
              fit: BoxFit.cover,
            ),
            childCount: 21,
          ),
        ),
      ],
    );
  }
}
