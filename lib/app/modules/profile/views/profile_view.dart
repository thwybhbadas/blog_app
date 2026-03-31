import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('profileView'.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
  onPressed: () {
    Get.updateLocale(Locale('ar'));
  },
  child: Text("Arabic"),
),

ElevatedButton(
  onPressed: () {
    Get.updateLocale(Locale('en'));
  },
  child: Text("English"),
),
        ],
      )
    );
  }
}
