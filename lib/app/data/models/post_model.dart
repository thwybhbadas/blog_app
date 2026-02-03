class PostModel {
  final String postId;
  final String userId;
  final String userName;
  final String content;
  final DateTime createdAt;
  final int likesCount;
  final int commentsCount;

  PostModel({
    required this.postId,
    required this.userId,
    required this.userName,
    required this.content,
    required this.createdAt,
    required this.likesCount,
    required this.commentsCount,
  });

  factory PostModel.fromMap(String id, Map<String, dynamic> data) {
    return PostModel(
      postId: id,
      userId: data['userId'],
      userName: data['userName'],
      content: data['content'],
      createdAt: data['createdAt'].toDate(),
      likesCount: data['likesCount'],
      commentsCount: data['commentsCount'],
    );
  }
}
