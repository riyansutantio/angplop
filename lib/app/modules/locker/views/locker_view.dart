import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/locker_controller.dart';

class LockerView extends GetView<LockerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LockerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LockerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
