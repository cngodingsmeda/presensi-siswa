import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_petugas_controller.dart';

class MainPetugasView extends GetView<MainPetugasController> {
  const MainPetugasView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainPetugasView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MainPetugasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
