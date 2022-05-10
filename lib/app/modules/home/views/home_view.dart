import 'package:angplop/app/modules/auth/controllers/auth_controller.dart';
import 'package:angplop/app/modules/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController =
      Get.put(HomeController(homeProvider: HomeProvider()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('HomeView'),
      //   centerTitle: true,
      // ),

      //navbar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor('#5FAD98'),
        child: Container(
          child: SvgPicture.asset('assets/homeMin.svg'),
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.00),
          color: HexColor('#5FAD98'),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  IconButton(
                    icon: SvgPicture.asset('assets/homePlus.svg'),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset('assets/homeTransfer.svg'),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      //body
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Container(
              decoration: BoxDecoration(color: HexColor('#7D85D5')),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //child: SvgPicture.asset('assets/logoAuth'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        child: Row(
                          children: [
                            Text('Necessity'),
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: SvgPicture.asset('assets/wallet.svg'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      controller.authController.logOut();
                    },
                    child: Text('logout'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
