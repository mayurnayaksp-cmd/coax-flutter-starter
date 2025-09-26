import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {"msg": "🔥 Someone liked your post", "time": "2m ago"},
      {"msg": "💬 New comment on your pic", "time": "5m ago"},
      {"msg": "👥 New follower joined Coax", "time": "10m ago"},
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: notifications.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.orange,
            child: const Icon(Icons.notifications, color: Colors.white),
          ),
          title: Text(notifications[index]["msg"]!),
          subtitle: Text(notifications[index]["time"]!),
        );
      },
    );
  }
}
