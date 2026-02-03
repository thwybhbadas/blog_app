import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_post_controller.dart';

class CreatePostView extends GetView<CreatePostController> {
   CreatePostView({super.key});
 final postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: postController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "What's on your mind?",
              ),
            ),

            const SizedBox(height: 20),

            Obx(
              () => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        controller.createPost(
                          postController.text,
                        );
                      },
                      child: const Text("Post"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
