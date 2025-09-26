import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Coax",
      theme: ThemeData(
        fontFamily: "Roboto",
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF7F6FB),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 4,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const FeedPage(),
    const Center(child: Text("Search")),
    const Center(child: Text("Notifications")),
    const Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coax"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text("User $index",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text("2h ago"),
                  trailing: const Icon(Icons.more_vert),
                ),
                const SizedBox(height: 12),
                const Text(
                  "This is a sample post. Let's make Coax social 🔥",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://picsum.photos/400/200?random=$index",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Icon(Icons.favorite_border),
                    SizedBox(width: 8),
                    Icon(Icons.chat_bubble_outline),
                    SizedBox(width: 8),
                    Icon(Icons.send),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
