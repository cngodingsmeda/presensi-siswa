import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/walas/detil_mapel_laporan_siswa_walas/views/detil_mapel_laporan_siswa_walas_view.dart';

import '../controllers/pilih_mapel_laporan_siswa_walas_controller.dart';

class PilihMapelLaporanSiswaWalasView
    extends GetView<PilihMapelLaporanSiswaWalasController> {
  const PilihMapelLaporanSiswaWalasView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PilihMapelLaporanSiswaWalasController());
    return Scaffold(
      body: AllMaterial.containerLinear(
        padding: 0,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      MdiIcons.arrowLeft,
                      color: AllMaterial.colorBlack,
                    ),
                  ),
                  SizedBox(
                    width: Get.width / 4.5,
                  ),
                  Text(
                    "Detil Laporan",
                    style: AllMaterial.workSans(
                      fontSize: 17,
                      fontWeight: AllMaterial.fontSemiBold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: AllMaterial.menuJadwal(
                        context: "Pukul ${controller.jam[index]}",
                        title: "Jam ${controller.mapel[index]}",
                        subtitleContext: "Guru Mapel :",
                        subtitle: controller.guru[index],
                        onTap: () {
                          Get.to(() => const DetilMapelLaporanSiswaWalasView());
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
