import 'package:angplop/app/modules/auth/views/auth_view.dart';
import 'package:angplop/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:angplop/app/modules/sign_up/provider/signUp_provider.dart';
import 'package:angplop/app/modules/sign_up/views/syarat_ketentuan_view.dart';
import 'package:angplop/app/widgets/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../home/views/home_view.dart';
import '../controllers/sign_up_controller.dart';
import 'kebijakan_privasi_view.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(signUpProvider: SignUpProvider()),
      builder: (controller) {
        return Scaffold(
          appBar: PreferredSize(
            child: Container(
              color: HexColor('#7D85D5'),
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  bottom: MediaQuery.of(context).padding.bottom),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.off(() => AuthView());
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              SvgPicture.asset('assets/arrow_back_white.svg')),
                    ),
                  ],
                ),
              ),
            ),
            preferredSize: Size.fromHeight(Get.height * 0.2),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: HexColor('#7D85D5')),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                    child: Column(
                      children: [
                        const Text(
                          "Mendaftar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Silahkan isi data akun anda",
                          style: GoogleFonts.nunito(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width / 20),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: controller.namaUserController,
                            decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      SvgPicture.asset('assets/iconNama.svg'),
                                ),
                                fillColor: HexColor('#5963BC').withOpacity(0.5),
                                filled: true,
                                hintText: 'Nama Lengkap',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.7)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color:
                                          HexColor('#5963BC').withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color:
                                          HexColor('#5963BC').withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width / 20),
                          child: TextFormField(
                            controller: controller.emailUserController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      SvgPicture.asset('assets/iconEmail.svg'),
                                ),
                                fillColor: HexColor('#5963BC').withOpacity(0.5),
                                filled: true,
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.7)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color:
                                          HexColor('#5963BC').withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color:
                                          HexColor('#5963BC').withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width / 20),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: controller.passwordUserController,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      SvgPicture.asset('assets/iconPass.svg'),
                                ),
                                fillColor: HexColor('#5963BC').withOpacity(0.5),
                                filled: true,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.7)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color:
                                          HexColor('#5963BC').withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color:
                                          HexColor('#5963BC').withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width / 20),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller:
                                controller.passwordConfirmUserController,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      SvgPicture.asset('assets/iconPass.svg'),
                                ),
                                fillColor: HexColor('#5963BC').withOpacity(0.5),
                                filled: true,
                                hintText: 'Tulis ulang password',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.7)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color:
                                          HexColor('#5963BC').withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color:
                                          HexColor('#5963BC').withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ),
                        Obx(() => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Checkbox(
                                    activeColor: Colors.white,
                                    checkColor: HexColor('#5963BC'),
                                    side: const BorderSide(
                                        color: Color(0xffffffff)),
                                    value: controller.checkboxStatus.value,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    onChanged: (bool? value) {
                                      controller.checkboxStatus.value = value!;
                                    },
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Saya sudah membaca serta menyetujui",
                                          style: GoogleFonts.nunito(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(() =>
                                                    SyaratKetentuanView());
                                              },
                                              child: Text(
                                                "Syarat dan Ketentuan",
                                                style: GoogleFonts.nunito(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Text(
                                              " menggunakan",
                                              style: GoogleFonts.nunito(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Angplop serta ",
                                              style: GoogleFonts.nunito(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(() =>
                                                    KebijakanPrivasiView());
                                              },
                                              child: Text(
                                                "Kebijakan privasi",
                                                style: GoogleFonts.nunito(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Text(
                                              "nya",
                                              style: GoogleFonts.nunito(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ))
                              ],
                            )),
                        Obx(
                          () => Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width / 20),
                            child: ElevatedButton(
                              onPressed: () {
                                if (controller.checkboxStatus.value == true) {
                                  if (controller.passwordUserController.text !=
                                      controller.passwordUserController.text) {
                                    snackBarNotificationFailed(
                                        title: "Password harus sama");
                                  } else {
                                    SystemChannels.textInput
                                        .invokeMethod('TextInput.hide');
                                    controller.addUser();
                                  }
                                } else {
                                  snackBarNotificationFailed(
                                      title:
                                          "Harus menyetujui syarat dan ketentuan");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  minimumSize: const Size.fromHeight(50),
                                  primary:
                                      controller.checkboxStatus.value == true
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.5)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Daftarkan",
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
                        ),
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
                            "Sudah punya akun?",
                            style: GoogleFonts.nunito(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => AuthView());
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Text(
                                "Login Sekarang",
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
        );
      },
    );
  }
}
