import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_mapel_controller.dart';

class MainMapelView extends GetView<MainMapelController> {
  const MainMapelView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainMapelView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MainMapelView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
