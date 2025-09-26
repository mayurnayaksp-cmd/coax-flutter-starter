import 'package:flutter/material.dart';

class HomeFeedScreen extends StatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  State<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen>
    with SingleTickerProviderStateMixin {
  int _likedPost = -1; // which post is liked
  bool _showHeart = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Map<String, String>> posts = [
    {
      "username": "john_doe",
      "userImage": "https://via.placeholder.com/150",
      "postImage": "https://picsum.photos/400/700?random=1",
      "caption": "Enjoying the sunshine 🌞",
    },
    {
      "username": "alex_smith",
      "userImage": "https://via.placeholder.com/150",
      "postImage": "https://picsum.photos/400/700?random=2",
      "caption": "My first post on Coax 🚀",
    },
    {
      "username": "sara_w",
      "userImage": "https://via.placeholder.com/150",
      "postImage": "https://picsum.photos/400/700?random=3",
      "caption": "Nature vibes 🍃",
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.2, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
  }

  void _onDoubleTap(int index) {
    setState(() {
      _likedPost = index;
      _showHeart = true;
    });
    _controller.forward(from: 0).then((_) {
      Future.delayed(const Duration(milliseconds: 600), () {
        setState(() => _showHeart = false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return GestureDetector(
            onDoubleTap: () => _onDoubleTap(index),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background Post
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Image.network(
                    post["postImage"]!,
                    fit: BoxFit.cover,
                  ),
                ),

                // Gradient overlay top (branding)
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.yellow],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.2],
                    ),
                  ),
                ),

                // Heart Animation
                if (_showHeart && _likedPost == index)
                  Center(
                    child: ScaleTransition(
                      scale: _animation,
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 100,
                      ),
                    ),
                  ),

                // Bottom content
                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(post["userImage"]!),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            post["username"]!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        post["caption"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Reaction bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.favorite_border,
                                  color: Colors.white, size: 30),
                              SizedBox(width: 20),
                              Icon(Icons.messenger_outline,
                                  color: Colors.white, size: 30),
                              SizedBox(width: 20),
                              Icon(Icons.send_outlined,
                                  color: Colors.white, size: 30),
                            ],
                          ),
                          const Icon(Icons.more_vert,
                              color: Colors.white, size: 28),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
