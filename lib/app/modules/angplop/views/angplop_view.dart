import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/angplop_controller.dart';

class AngplopView extends GetView<AngplopController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AngplopView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AngplopView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
