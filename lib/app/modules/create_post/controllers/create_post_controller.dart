import 'package:get/get.dart';
import 'package:myblog/app/data/models/post_model.dart';
import 'package:myblog/app/data/services/firebase_services.dart';

class CreatePostController extends GetxController {
  //TODO: Implement CreatePostController

 final FirebaseService _service = FirebaseService();

  final isLoading = false.obs;

  Future<void> createPost(String content) async {
    if (content.trim().isEmpty) return;

    try {
      isLoading.value = true;

      final post = PostModel(
        postId: '',
        userId: 'currentUserId',
        userName: 'User Name',
        content: content,
        createdAt: DateTime.now(),
        likesCount: 0,
        commentsCount: 0,
      );

      await _service.createPost(post);

      Get.back(); // يرجع للهوم

    } finally {
      isLoading.value = false;
    }
  }
}