import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/petugas/absen_kelas_harian_petugas/views/absen_kelas_harian_petugas_view.dart';

import '../controllers/absen_harian_siswa_petugas_controller.dart';

class AbsenHarianSiswaPetugasView
    extends GetView<AbsenHarianSiswaPetugasController> {
  const AbsenHarianSiswaPetugasView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AbsenHarianSiswaPetugasController());
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
                    "Absen Siswa",
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
                  itemCount: controller.kelas.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: AllMaterial.cardWidget(
                        svg: SvgPicture.asset("assets/svg/absen-ceklis.svg"),
                        tengah: "Kelas ${controller.kelas[index]}",
                        atas: "Senin, 24 Agustus 2024",
                        bawah: "SMK Negeri 2 Mataram",
                        onTap: () {
                          Get.to(() => const AbsenKelasHarianPetugasView(),
                              arguments: controller.kelas[index]);
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
