import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myblog/app/data/models/post_model.dart';
import '../models/user_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(UserModel user) async {
    await _firestore
        .collection('users')
        .doc(user.uid)
        .set(user.toMap());
  }

  Future<UserModel?> getUserData(String uid) async {
    final doc =
        await _firestore.collection('users').doc(uid).get();

    if (!doc.exists) return null;

    return UserModel.fromMap(doc.data()!);
  }

  // CREATE POST
  Future<void> createPost(PostModel post) async {
    await _firestore.collection('posts').add({
      'userId': post.userId,
      'userName': post.userName,
      'content': post.content,
      'createdAt': Timestamp.now(),
      'likesCount': 0,
      'commentsCount': 0,
    });
  }

  // READ POSTS (REAL-TIME)
  Stream<QuerySnapshot> getPostsStream() {
    return _firestore
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // LIKE / UNLIKE
  Future<void> toggleLike(String postId, String userId) async {
    final likeRef =
        _firestore.collection('posts').doc(postId).collection('likes').doc(userId);

    final doc = await likeRef.get();

    if (doc.exists) {
      await likeRef.delete();
      await _firestore.collection('posts').doc(postId)
          .update({'likesCount': FieldValue.increment(-1)});
    } else {
      await likeRef.set({'likedAt': Timestamp.now()});
      await _firestore.collection('posts').doc(postId)
          .update({'likesCount': FieldValue.increment(1)});
    }
  }
Future<void> toggleFollow(String myId, String otherUserId) async {
  final followRef = _firestore
      .collection('users')
      .doc(myId)
      .collection('following')
      .doc(otherUserId);

  final doc = await followRef.get();

  if (doc.exists) {
    await followRef.delete();
  } else {
    await followRef.set({'followedAt': Timestamp.now()});
  }
}
}
