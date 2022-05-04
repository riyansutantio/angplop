import 'package:angplop/app/modules/auth/bindings/auth_binding.dart';
import 'package:angplop/app/modules/auth/provider/auth_provider.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthProvider? authProvider;
  AuthController({required this.authProvider});
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
