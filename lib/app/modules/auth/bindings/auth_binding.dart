import 'package:angplop/app/modules/auth/provider/auth_provider.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(authProvider: AuthProvider()),
    );
  }
}
