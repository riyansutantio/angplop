import 'dart:io';

import 'package:angplop/app/modules/auth/bindings/auth_binding.dart';
import 'package:angplop/app/modules/auth/controllers/auth_controller.dart';
import 'package:angplop/app/modules/auth/provider/auth_provider.dart';
import 'package:angplop/app/modules/auth/views/forgot_password_view.dart';
import 'package:angplop/app/modules/home/views/home_view.dart';
import 'package:angplop/app/modules/sign_up/views/sign_up_view.dart';
import 'package:angplop/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AuthView extends GetView<AuthController> {
  final AuthController authController =
      Get.put(AuthController(authProvider: AuthProvider()));
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willPopWithFuncOnly(func: exit(0)),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: HexColor('#7D85D5')),
          child: Obx(
            () => Stack(
              children: [
                Positioned(
                    top: MediaQuery.of(context).size.height * -0.02,
                    right: 0,
                    child: SvgPicture.asset('assets/backgroundArrow.svg')),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0,
                                    MediaQuery.of(context).size.width / 6,
                                    0,
                                    MediaQuery.of(context).size.width / 15),
                                child: Image.asset('assets/iconAuth.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child:
                                    SvgPicture.asset('assets/angplopText.svg'),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width / 20),
                          child: Column(
                            children: [
                              Text(
                                "Selamat Datang",
                                style: GoogleFonts.nunito(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.width / 10),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  onFieldSubmitted: (val) {},
                                  controller: authController.emailController,
                                  decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                            'assets/iconEmail.svg'),
                                      ),
                                      fillColor:
                                          HexColor('#5963BC').withOpacity(0.5),
                                      filled: true,
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                          color: Colors.white.withOpacity(0.7)),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: HexColor('#5963BC')
                                                .withOpacity(0.5)),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: HexColor('#5963BC')
                                                .withOpacity(0.5)),
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.width / 20),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.white),
                                  controller: authController.passwordController,
                                  onFieldSubmitted: (val) {},
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                            'assets/iconPass.svg'),
                                      ),
                                      fillColor:
                                          HexColor('#5963BC').withOpacity(0.5),
                                      filled: true,
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          color: Colors.white.withOpacity(0.7)),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: HexColor('#5963BC')
                                                .withOpacity(0.5)),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: HexColor('#5963BC')
                                                .withOpacity(0.5)),
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.width / 20),
                                child: ElevatedButton(
                                  onPressed: () {
                                    authController.login();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      minimumSize: Size.fromHeight(50),
                                      primary: Colors.white),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "Masuk",
                                        style: GoogleFonts.nunito(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: HexColor('#5963BC')),
                                      ),
                                      SvgPicture.asset('assets/arrowRight.svg')
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => ForgotPasswordView());
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.05),
                                  child: Text(
                                    "Anda lupa password?",
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Text(
                                  "Belum punya akun?",
                                  style: GoogleFonts.nunito(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => SignUpView());
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Text(
                                      "Daftar Sekarang",
                                      style: GoogleFonts.nunito(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: HexColor('#5963BC').withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                (controller.isLoading.value == true)
                    ? Container(
                        color: HexColor('#5963BC').withOpacity(0.3),
                        height: MediaQuery.of(context).size.height,
                        child: const SpinKitWave(color: Colors.white),
                      )
                    : SizedBox(
                        height: 1,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
