import 'package:flutter/material.dart';

class HomeFeedScreen extends StatelessWidget {
  const HomeFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coax"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildPost(
            username: "john_doe",
            userImage: "https://via.placeholder.com/150",
            postImage: "https://picsum.photos/400/300?random=1",
            caption: "Enjoying the sunshine 🌞",
            likes: 120,
          ),
          _buildPost(
            username: "alex_smith",
            userImage: "https://via.placeholder.com/150",
            postImage: "https://picsum.photos/400/300?random=2",
            caption: "My first post on Coax 🚀",
            likes: 85,
          ),
          _buildPost(
            username: "sara_w",
            userImage: "https://via.placeholder.com/150",
            postImage: "https://picsum.photos/400/300?random=3",
            caption: "Nature vibes 🍃",
            likes: 230,
          ),
        ],
      ),
    );
  }

  Widget _buildPost({
    required String username,
    required String userImage,
    required String postImage,
    required String caption,
    required int likes,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
          title: Text(username,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.more_vert),
        ),
        Image.network(postImage, fit: BoxFit.cover, height: 250, width: double.infinity),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: const [
              Icon(Icons.favorite_border, size: 28),
              SizedBox(width: 15),
              Icon(Icons.comment_outlined, size: 28),
              SizedBox(width: 15),
              Icon(Icons.send_outlined, size: 28),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "$likes likes",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            caption,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
