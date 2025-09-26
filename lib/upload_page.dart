import 'package:flutter/material.dart';
import 'post_model.dart';
import 'upload_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = [
    Post(
      id: '1',
      userName: 'Rahul Sharma',
      userAvatar: 'https://i.pravatar.cc/150?img=1',
      content: 'Hello Coax fam! Excited to be here 🚀',
      imageUrl: 'https://picsum.photos/400/300',
      timestamp: DateTime.now(),
    ),
    Post(
      id: '2',
      userName: 'Aditi Verma',
      userAvatar: 'https://i.pravatar.cc/150?img=2',
      content: 'Such a beautiful day 🌸',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
  ];

  void _addPost(Post newPost) {
    setState(() {
      posts.insert(0, newPost); // new posts appear on top
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coax Feed"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(post.userAvatar),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        post.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${post.timestamp.hour}:${post.timestamp.minute.toString().padLeft(2, '0')}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(post.content),
                  if (post.imageUrl != null) ...[
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(post.imageUrl!),
                    ),
                  ]
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add),
        onPressed: () async {
          final newPost = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UploadScreen()),
          );
          if (newPost != null && newPost is Post) {
            _addPost(newPost);
          }
        },
      ),
    );
  }
}
