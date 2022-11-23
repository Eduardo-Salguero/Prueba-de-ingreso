class Post {
  late String userId;
  late String id;
  late String title;
  late String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
}

List<Post> posts = [];
