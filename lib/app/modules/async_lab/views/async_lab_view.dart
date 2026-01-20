import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/async_lab_controller.dart';

class AsyncLabView extends GetView<AsyncLabController> {
  const AsyncLabView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Future Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(controller.result.value)),

            // ElevatedButton(
            //   onPressed: () async {
            //     controller.result.value = await controller.fetchData();
            //   },
            //   child: Text("Load Data"),
            // ),

            // StreamBuilder<int>(
            //   stream: controller.counterStream(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Text(
            //         "Counter: ${snapshot.data}",
            //         style: TextStyle(fontSize: 24),
            //       );
            //     }
            //     return CircularProgressIndicator();
            //   },
            // ),
            ElevatedButton(
              onPressed: () {
                controller.loadData();
              },
              child: Text("Load with async/await"),
            ),
          ],
        ),
      ),
    );
  }
}
