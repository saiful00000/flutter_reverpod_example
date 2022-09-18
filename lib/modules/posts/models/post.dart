class Post {
  int userId = 0;
  int id = 0;
  String title = '';
  String body = '';

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] ?? 0;
    id = json['id'] ?? 0;
    title = json['title'] ?? '';
    body = json['body'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
