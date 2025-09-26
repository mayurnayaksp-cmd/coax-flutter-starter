class Post {
  final String id;
  final String userName;
  final String userAvatar;
  final String content;
  final String? imageUrl;
  final DateTime timestamp;

  Post({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.content,
    this.imageUrl,
    required this.timestamp,
  });
}
