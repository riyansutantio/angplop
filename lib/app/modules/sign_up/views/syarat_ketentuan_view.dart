import 'package:angplop/app/modules/sign_up/views/kebijakan_privasi_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:angplop/app/modules/sign_up/provider/signUp_provider.dart';

import '../controllers/sign_up_controller.dart';

class SyaratKetentuanView extends GetView<SignUpController> {
  var flutterWebviewPlugin;
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
                    left: 5.0, top: 10.0, right: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                  'assets/arrow_back_white.svg')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Syarat dan Ketentuan",
                            style: GoogleFonts.nunito(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: HexColor('#ffffff')),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset('assets/iconWarning.svg'),
                    )
                  ],
                ),
              ),
            ),
            preferredSize: Size.fromHeight(Get.height * 0.2),
          ),
          body: Container(
            decoration: BoxDecoration(color: HexColor('#7D85D5')),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
              child: SingleChildScrollView(
                child: Obx(
                  () => Html(
                    data: controller.termResult.value,
                    onLinkTap: (url, _, __, ___) {
                      Get.to(() => KebijakanPrivasiView());
                    },
                    style: {
                      "h1": Style(
                        color: HexColor('#6D8DAD'),
                        fontFamily: 'Nunito',
                      ),
                      "p": Style(
                        fontFamily: 'Nunito',
                        fontSize: FontSize(15),
                        color: HexColor('#6D8DAD'),
                      ),
                      "ol": Style(
                        fontFamily: 'Nunito',
                        color: HexColor('#6D8DAD'),
                      ),
                      "li": Style(
                        fontFamily: 'Nunito',
                        fontSize: FontSize(15),
                        color: HexColor('#6D8DAD'),
                      ),
                      "h3": Style(
                        fontFamily: 'Nunito',
                        color: HexColor('#6D8DAD'),
                      ),
                      "div": Style(
                        fontFamily: 'Nunito',
                        fontSize: FontSize(15),
                        color: HexColor('#6D8DAD'),
                      ),
                      "b": Style(
                        fontFamily: 'Nunito',
                        color: HexColor('#6D8DAD'),
                      )
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
