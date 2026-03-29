import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;


// ✅ uid المستخدم الحالي
  String? get currentUserId => _auth.currentUser?.uid;
  // ✅ تحقق من توفر username
  Future<bool> isusernameAvailable(String username) async {
    final doc = await _firestore
        .collection('usernames')
        .doc(username.toLowerCase())
        .get();

    return !doc.exists;
  }

  Future<void> saveUserData(UserModel user) async {
    // users collection
    await _firestore.collection('users').doc(user.uid).set(user.toMap());
    // usernames collection
    await _firestore
        .collection('usernames')
        .doc(user.username.toLowerCase())
        .set({'uid': user.uid});
  }

  Future<UserModel?> getUserData(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();

    if (!doc.exists) return null;

    return UserModel.fromMap(doc.data()!);
  }

  Future<UserModel?> getCurrentUser() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final doc = await _firestore.collection('users').doc(uid).get();

  if (!doc.exists) return null;

  return UserModel.fromMap(doc.data()!);
}

 // ✅ username المستخدم الحالي
  Future<String?> getCurrentUsername() async {
    final uid = currentUserId;
    if (uid == null) return null;

    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) return null;

    return doc['username'];
  }
 // CREATE POST
  Future<void> createPost(String content) async {
    final uid = currentUserId;
    if (uid == null) throw Exception('Not logged in');

    final username = await getCurrentUsername();

    await _firestore.collection('posts').add({
      'userId': uid,
      'username': username,
      'content': content,
      'createdAt': Timestamp.now(),
      'likesCount': 0,
      'commentsCount': 0,
    });
  }

 // LIKE / UNLIKE
  Future<void> toggleLike(String postId) async {
    final uid = currentUserId;
    if (uid == null) return;

    final likeRef = _firestore
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(uid);

    final doc = await likeRef.get();

    if (doc.exists) {
      await likeRef.delete();
      await _firestore.collection('posts').doc(postId).update({
        'likesCount': FieldValue.increment(-1),
      });
    } else {
      await likeRef.set({'likedAt': Timestamp.now()});
      await _firestore.collection('posts').doc(postId).update({
        'likesCount': FieldValue.increment(1),
      });
    }
  }

  Stream<QuerySnapshot> getPostsStream() {
    return _firestore
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
