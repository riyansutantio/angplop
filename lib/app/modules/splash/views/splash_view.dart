import 'package:flutter_svg/flutter_svg.dart';
import 'package:angplop/app/modules/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      controller.checkStateUser();
                    },
                    child: SvgPicture.asset('assets/iconAnplop.svg')),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset('assets/angplopText.svg'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Rencanakan, Anggarkan, Wujudkan',
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: HexColor('#7D85D5'),
            ),
          ),
        );
      },
    );
  }
}
