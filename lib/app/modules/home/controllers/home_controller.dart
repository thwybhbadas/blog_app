import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myblog/app/data/services/firebase_services.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

 final FirebaseService _service = FirebaseService();

  Stream<QuerySnapshot> get postsStream => _service.getPostsStream();

  void likePost(String postId, String userId) {
    _service.toggleLike(postId, userId);
  }
}