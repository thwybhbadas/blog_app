import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String postId;
  final String userId;
  final String username;
  final String content;
  final DateTime createdAt;
  final int likesCount;
  final int commentsCount;

  PostModel({
    required this.postId,
    required this.userId,
    required this.username,
    required this.content,
    required this.createdAt,
    required this.likesCount,
    required this.commentsCount,
  });
Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'content': content,
      'createdAt': Timestamp.now(),
      'likesCount': likesCount,
      'commentsCount': commentsCount,
    };
  }

  factory PostModel.fromMap(String id, Map<String, dynamic> data) {
    return PostModel(
      postId: id,
      userId: data['userId'],
      username: data['username'],
      content: data['content'],
      createdAt: (data['createdAt']as Timestamp).toDate(),
      likesCount: data['likesCount'],
      commentsCount: data['commentsCount'],
    );
  }
}
