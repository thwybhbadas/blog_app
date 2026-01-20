import 'package:get/get.dart';

import '../controllers/prfile_controller.dart';

class PrfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrfileController>(
      () => PrfileController(),
    );
  }
}
