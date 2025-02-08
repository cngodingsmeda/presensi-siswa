import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/mapel/absen_bulanan_kelas_mapel/views/absen_bulanan_kelas_mapel_view.dart';
import 'package:presensi_siswa/app/modules/mapel/main_mapel/controllers/main_mapel_controller.dart';

import '../controllers/laporan_mapel_controller.dart';

class LaporanMapelView extends GetView<LaporanMapelController> {
  const LaporanMapelView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LaporanMapelController());
    final mainCont = Get.put(MainMapelController());
    return Scaffold(
      body: AllMaterial.containerLinear(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: [
                Text(
                  "Laporan Kelas",
                  style: AllMaterial.workSans(
                    fontSize: 17,
                    fontWeight: AllMaterial.fontSemiBold,
                  ),
                ),
                const SizedBox(height: 17),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                        itemCount:
                            controller.kelasDiajar.value?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          if (controller.kelasDiajar.value?.data == null ||
                              controller.kelasDiajar.value?.data == []) {
                            return Center(
                              child: Text(
                                "Tidak ada kelas yang diajar",
                                style: AllMaterial.workSans(
                                    color: AllMaterial.colorGreySec),
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Obx(
                              () => AllMaterial.cardWidget(
                                atas: "Absen Bulanan",
                                tengah:
                                    "Kelas ${controller.kelasDiajar.value?.data?[index].nama}",
                                bawah: mainCont.profilMapel.value?.data?.sekolah
                                        ?.nama ??
                                    "",
                                onTap: () {
                                  Get.to(
                                      () => const AbsenBulananKelasMapelView(),
                                      arguments: {
                                        "namaKelas": controller.kelasDiajar
                                            .value?.data?[index].nama,
                                        "idKelas": controller
                                            .kelasDiajar.value?.data?[index].id,
                                            "walas": controller
                                            .kelasDiajar.value?.data?[index].guruWalas?.nama
                                      });
                                },
                                svg: SvgPicture.asset(
                                    fit: BoxFit.cover,
                                    "assets/svg/absen-ceklis.svg"),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
