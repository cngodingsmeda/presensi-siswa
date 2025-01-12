import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detil_mapel_laporan_siswa_walas_controller.dart';

class DetilMapelLaporanSiswaWalasView
    extends GetView<DetilMapelLaporanSiswaWalasController> {
  const DetilMapelLaporanSiswaWalasView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetilMapelLaporanSiswaWalasView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetilMapelLaporanSiswaWalasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
