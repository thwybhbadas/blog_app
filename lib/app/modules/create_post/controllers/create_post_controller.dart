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
      await _service.createPost(content.trim());
      Get.back();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}