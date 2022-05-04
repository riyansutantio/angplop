import 'package:angplop/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:angplop/app/modules/sign_up/provider/signUp_provider.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  SignUpProvider? signUpProvider;
  SignUpController({required this.signUpProvider});

  //variable
  final checkboxStatus = false.obs;


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
