import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myblog/app/data/models/post_model.dart';
import 'package:myblog/app/modules/auth/controllers/auth_controller.dart';
import 'package:myblog/app/modules/home/controllers/home_controller.dart';
import 'package:myblog/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {

   HomeView({super.key});
  final authcontrol =Get.find<AuthController>();
   void showLogoutDialog() {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to logout?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back(); // close dialog
        authcontrol.logout();
      },
      onCancel: () {
        Get.back(); // close dialog فقط
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true,actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed:
              showLogoutDialog,     )]),
           
      body: StreamBuilder(
        stream: controller.postsStream,
        builder: (context, snapshot) {
          // تحميل
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // خطأ
          if (snapshot.hasError) {
            return Center(child: Text('Error'));
          }

          // لا يوجد بوستات
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('لا توجد بوستات'));
          }

          final posts = snapshot.data!.docs;

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = PostModel.fromMap(
                posts[index].id,
                posts[index].data() as Map<String, dynamic>,
              );

              return Card(
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '@${post.username}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(post.content),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite),
                            onPressed: () {
                              controller.likePost(post.postId);
                            },
                          ),
                          Text(post.likesCount.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      // زر إنشاء بوست
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.CREATE_POST);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
