class ChatUser {
  final String username;
  final DateTime date;
  final int unread;
  final bool active;
  ChatUser({
    required this.username,
    required this.date,
    required this.unread,
    required this.active,
  });
}
