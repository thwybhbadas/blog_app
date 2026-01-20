import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/prfile_controller.dart';

class PrfileView extends GetView<PrfileController> {
  const PrfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PrfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
