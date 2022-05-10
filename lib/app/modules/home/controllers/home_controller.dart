import 'package:angplop/app/modules/auth/controllers/auth_controller.dart';
import 'package:angplop/app/modules/auth/provider/auth_provider.dart';
import 'package:angplop/app/modules/home/provider/home_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeProvider? homeProvider;
  HomeController({required this.homeProvider});

  final AuthController authController = Get.put(AuthController(authProvider: AuthProvider()));
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
