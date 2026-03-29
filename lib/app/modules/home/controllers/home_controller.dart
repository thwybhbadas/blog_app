import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:myblog/app/data/services/firebase_services.dart';
import 'package:myblog/app/modules/auth/controllers/auth_controller.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

 final FirebaseService _service = FirebaseService();

  Stream<QuerySnapshot> get postsStream => _service.getPostsStream();

  void likePost(String postId) {
    _service.toggleLike(postId);
  }
}