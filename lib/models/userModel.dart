class ChatUser {
  final String id;
  final String username;
  final String date;
  final bool pinned;
  final String recentText;
  final bool typing;
  final int unread;
  final int total;
  ChatUser({
    this.id = 'random_id',
    this.username = 'User_loading',
    this.date = 'loading',
    this.pinned = true,
    this.recentText = 'Recent Text',
    this.typing = true,
    this.unread = 2,
    this.total = 0,
  });
}
