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
              const SizedBox(height: 10),
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
              Obx(
                () => controller.totalKelas.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Tidak ada kelas yang dapat ditinjau",
                              style: AllMaterial.workSans(
                                fontWeight: AllMaterial.fontMedium,
                                color: AllMaterial.colorGreySec,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Obx(
                          () => ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  controller.kelas.value?.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: AllMaterial.cardWidget(
                                    svg: SvgPicture.asset(
                                        "assets/svg/absen-ceklis.svg"),
                                    tengah:
                                        "Kelas ${controller.kelas.value?.data?[index].nama}",
                                    bawah: AllMaterial.hariTanggalBulanTahun(
                                      DateTime.now().toIso8601String(),
                                    ),
                                    atas: "Absen Harian",
                                    onTap: () {
                                      Get.to(
                                        () =>
                                            const AbsenKelasHarianPetugasView(),
                                        arguments: controller
                                            .kelas.value?.data?[index].nama,
                                      );
                                    },
                                  ),
                                );
                              }),
                        ),
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
