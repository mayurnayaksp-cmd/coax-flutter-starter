import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      "🔥 User123 liked your post",
      "💬 User456 commented: Awesome!",
      "👥 User789 started following you",
      "❤️ User111 liked your photo",
      "📸 User222 tagged you in a post",
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Notifications"),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(
              notifications[index],
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              "2h ago",
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            trailing: const Icon(Icons.favorite, color: Colors.redAccent),
          );
        },
      ),
    );
  }
}
