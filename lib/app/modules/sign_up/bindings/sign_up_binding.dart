import 'package:angplop/app/modules/sign_up/provider/signUp_provider.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(signUpProvider: SignUpProvider()),
    );
  }
}
