import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myblog/app/modules/auth/controllers/auth_controller.dart';


class HomeView extends GetView<AuthController> {
  const HomeView({super.key});

   void showLogoutDialog() {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to logout?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back(); // close dialog
        controller.logout();
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
              showLogoutDialog,
           
          )
        ],),
      body: const Center(
        child: Text(
          "Welcome Home 👋",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}