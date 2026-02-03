import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myblog/app/data/models/post_model.dart';
import 'package:myblog/app/modules/auth/controllers/auth_controller.dart';
import 'package:myblog/app/modules/home/controllers/home_controller.dart';
import 'package:myblog/app/routes/app_pages.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  //  void showLogoutDialog() {
  //   Get.defaultDialog(
  //     title: "Logout",
  //     middleText: "Are you sure you want to logout?",
  //     textConfirm: "Yes",
  //     textCancel: "No",
  //     confirmTextColor: Colors.white,
  //     onConfirm: () {
  //       Get.back(); // close dialog
  //       controller.logout();
  //     },
  //     onCancel: () {
  //       Get.back(); // close dialog فقط
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('HomeView'), centerTitle: true,actions: [
      //     IconButton(
      //       icon: const Icon(Icons.logout),
      //       onPressed:
      //         // showLogoutDialog,
           
      //     )
      //   ],),
      body: StreamBuilder(
  stream: controller.postsStream,
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return const Center(child: CircularProgressIndicator());
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.userName),
              Text(post.content),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      controller.likePost(post.postId, 'currentUserId');
                    },
                  ),
                  Text(post.likesCount.toString()),
                ],
              ),
            ],
          ),
        );
      },
    );
  },
),
 floatingActionButton: FloatingActionButton(
    onPressed: () {
      Get.toNamed(Routes.CREATE_POST);
    },
    child: const Icon(Icons.add),
  ),

    );
  }
}