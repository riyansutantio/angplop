import 'package:get/get.dart';

import '../controllers/angplop_controller.dart';

class AngplopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AngplopController>(
      () => AngplopController(),
    );
  }
}
