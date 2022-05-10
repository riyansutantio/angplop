import 'dart:async';

import 'package:angplop/app/modules/auth/bindings/auth_binding.dart';
import 'package:angplop/app/modules/auth/provider/auth_provider.dart';
import 'package:angplop/app/modules/auth/views/auth_view.dart';
import 'package:angplop/app/modules/auth/views/reset_password_view.dart';
import 'package:angplop/app/widgets/snackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uni_links/uni_links.dart' as UniLink;

import '../../../routes/app_pages.dart';
import '../../../utils/initials.dart';
import '../../../utils/utils.dart';

class AuthController extends GetxController {
  AuthProvider? authProvider;
  AuthController({required this.authProvider});
  final count = 0.obs;
  final boxUser = GetStorage();

  //variable input
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotEmailController = TextEditingController();
  final resetPasswordController = TextEditingController();
  final confirmResetPasswordController = TextEditingController();
  final token = ''.obs;

  //state login
  final isLoading = false.obs;
  final isLoadingForgotPassword = false.obs;

  @override
  void onInit() async {
    super.onInit();
    checkDeepLink();
    // await clearCondition();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future login() async {
    isLoading.value = true;
    try {
      final res = await authProvider?.login(
          email: emailController.text, password: passwordController.text);
      logger.i(res!.message!);
      if (res.message == "failed") {
        snackBarNotificationFailed(title: "User tidak ditemukan");
        isLoading.value = false;
      } else if (res.message == "Credential not match") {
        snackBarNotificationFailed(title: "Password salah");
        isLoading.value = false;
      } else if (res.message == "The given data was invalid.") {
        snackBarNotificationFailed(title: "Pastikan data benar");
        isLoading.value = false;
      } else {
        boxUser.write(tokenBearer, res.data?.token);
        snackBarNotificationSuccess(title: 'Berhasil login');
        await Future.delayed(const Duration(seconds: 1))
            .whenComplete(() => Get.offAllNamed(Routes.HOME));
        isLoading.value = false;
      }
    } catch (e) {
      logger.w(e);
      isLoading.value = false;
    } finally {
      logger.d("finally");
      isLoading.value = false;
    }
  }

  Future logOut() async {
    final res = await authProvider!.logOut(
        email: boxUser.read(email),
        password: boxUser.read(password),
        bearer: boxUser.read(tokenBearer));
    logger.i(res!.message!);
    if (res.message == "Logout Successfully") {
      await Get.toNamed(Routes.AUTH);
      snackBarNotificationSuccess(title: res.message);
      boxUser.write(tokenBearer, null);
      boxUser.write(email, null);
      boxUser.write(password, null);
    } else {
      boxUser.write(tokenBearer, null);
      boxUser.write(email, null);
      boxUser.write(password, null);
    }
  }

  Future forgotPassword() async {
    isLoadingForgotPassword.value = true;
    final res =
        await authProvider!.forgotPassword(email: forgotEmailController.text);
    if (res!.status == null) {
      logger.e(res.message);
      isLoadingForgotPassword.value = false;
    } else {
      snackBarNotificationSuccess(title: res.message);
      Get.to(() => AuthView());
      isLoadingForgotPassword.value = false;
    }
  }

  Future checkDeepLink() async {
    StreamSubscription _sub;
    try {
      print("checkDeepLink");
      await UniLink.getInitialLink();
      // ignore: deprecated_member_use
      _sub = UniLink.getUriLinksStream().listen((uri) {
        // WidgetsFlutterBinding.ensureInitialized();
        Get.to(() => ResetPasswordView());
        String Uri = uri.toString();
        final splitted = Uri.split('/');
        token.value = splitted[7];
        logger.d("uri $uri");
        logger.d("token ${token.value}");
      }, onError: (err) {
        // Handle exception by warning the user their action did not succeed
        logger.e("error when getting uri");
      });
    } on PlatformException {
      print("PlatformException 1");
    } on Exception {
      print('Exception thrown 2');
    }
  }

  Future<void> clearCondition() async {
    passwordController.clear();
    confirmResetPasswordController.clear();
  }

  Future resetPassword() async {
    final res = await authProvider!.resetPassword(
        password: resetPasswordController.text,
        password_confirmation: confirmResetPasswordController.text,
        token: token.value);
    logger.i(res?.message);
    if (res!.message! == 'Password succesfully updated') {
      Get.off(() => AuthView());
      snackBarNotificationSuccess(title: 'Berhasil diubah');
    } else {
      snackBarNotificationFailed(title: 'Gagal diubah');
    }
  }
}
