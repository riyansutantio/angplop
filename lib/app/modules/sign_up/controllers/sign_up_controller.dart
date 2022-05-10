import 'package:angplop/app/models/auth/register_model.dart';
import 'package:angplop/app/modules/auth/views/auth_view.dart';
import 'package:angplop/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:angplop/app/modules/sign_up/provider/signUp_provider.dart';
import 'package:angplop/app/widgets/snackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../../utils/initials.dart';
import '../../../utils/utils.dart';

class SignUpController extends GetxController {
  SignUpProvider? signUpProvider;
  SignUpController({required this.signUpProvider});

  //variable
  final checkboxStatus = false.obs;
  final isLoading = false.obs;
  final boxUser = GetStorage();
  final termResult = ''.obs;
  final privacyResult = ''.obs;

  //controller
  final emailUserController = TextEditingController();
  final namaUserController = TextEditingController();
  final passwordUserController = TextEditingController();
  final passwordConfirmUserController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getTerm();
    await getPrivacy();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future getTerm() async {
    try {
      isLoading.value = true;
      final res =
          await signUpProvider!.getTerm(bearer: boxUser.read(tokenBearer));
      // logger.wtf(res!.data!.data!.toList());
      if (res == null) {
        logger.e("Datat term kosong");
      } else if (res.status == "success") {
        termResult.value = res.data!.content.toString();
      }
    } catch (e) {
      logger.e(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future getPrivacy() async {
    try {
      isLoading.value = true;
      final res =
          await signUpProvider!.getPrivacy(bearer: boxUser.read(tokenBearer));
      // logger.wtf(res!.data!.data!.toList());
      if (res == null) {
        logger.e("Datat term kosong");
      } else if (res.status == "success") {
        privacyResult.value = res.data!.content.toString();
      }
    } catch (e) {
      logger.e(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> clearCondition() async {
    namaUserController.clear();
    emailUserController.clear();
    passwordUserController.clear();
    passwordConfirmUserController.clear();
  }

  Future addUser() async {
    final res = await signUpProvider!.addUser(
        email: emailUserController.text,
        name: namaUserController.text,
        password: passwordUserController.text,
        passwordConfirm: passwordConfirmUserController.text);
    // logger.i(emailUserController.text);
    // logger.i(namaUserController.text);
    // logger.i(passwordUserController.text);
    // logger.i(passwordConfirmUserController.text);
    logger.i(res?.message);
    if (res!.message! == 'User successfully registered') {
      await clearCondition();
      Get.off(() => AuthView());
      snackBarNotificationSuccess(title: 'Berhasil ditambahkan');
    } else {
      snackBarNotificationFailed(title: 'Gagal ditambahkan');
    }
  }
}
