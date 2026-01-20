import 'package:get/get.dart';

import '../controllers/async_lab_controller.dart';

class AsyncLabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AsyncLabController>(
      () => AsyncLabController(),
    );
  }
}
