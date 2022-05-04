import 'package:angplop/app/modules/auth/views/auth_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/initials.dart';
import '../../../utils/utils.dart';
import '../../home/views/home_view.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await checkStateUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  final boxUser = GetStorage();

  checkStateUser() async {
    //logger.i(boxUser.read(tokenBearer));
    // await Future.delayed(const Duration(seconds: 2))
    //     .whenComplete(() => boxUser.read(tokenBearer) == null ? Get.offAllNamed(Routes.SESSION) : Get.to(HomeView()));

    Future.delayed(const Duration(seconds: 2))
        .whenComplete(() => Get.off(AuthView()));
  }
}
