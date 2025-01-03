import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_siswa_controller.dart';

class MainSiswaView extends GetView<MainSiswaController> {
  const MainSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainSiswaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MainSiswaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
