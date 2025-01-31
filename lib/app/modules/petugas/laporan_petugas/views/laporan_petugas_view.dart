import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/petugas/absen_bulanan_siswa_petugas/views/absen_bulanan_siswa_petugas_view.dart';
import 'package:presensi_siswa/app/modules/petugas/absen_harian_siswa_petugas/controllers/absen_harian_siswa_petugas_controller.dart';
import 'package:presensi_siswa/app/modules/petugas/main_petugas/controllers/main_petugas_controller.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../controllers/laporan_petugas_controller.dart';

class LaporanPetugasView extends GetView<LaporanPetugasController> {
  const LaporanPetugasView({super.key});
  @override
  Widget build(BuildContext context) {
    final kelasC = Get.put(AbsenHarianSiswaPetugasController());
    final profC = Get.put(MainPetugasController());
    kelasC.fetchKelasTinjauan(getTo: false);
    print(kelasC.kelas.value?.data?.kelas?.length);
    return Scaffold(
      body: AllMaterial.containerLinear(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
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
                        itemCount: kelasC.kelas.value?.data?.kelas?.length ?? 0,
                        itemBuilder: (context, index) {
                          var kelasTinjauan =
                              kelasC.kelas.value?.data?.kelas?[index];
                          return Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Obx(
                              () => AllMaterial.cardWidget(
                                atas: "Absen Bulanan",
                                tengah: "Kelas ${kelasTinjauan?.nama ?? ""}",
                                bawah: profC.profilPetugas.value?.data?.sekolah
                                        ?.nama!
                                        .toUpperCase() ??
                                    "",
                                onTap: () {
                                  Get.to(
                                      () =>
                                          const AbsenBulananSiswaPetugasView(),
                                      arguments: {
                                        "namaKelas": kelasTinjauan?.nama ?? "",
                                        "idKelas":
                                            kelasTinjauan?.id.toString() ?? "",
                                      });
                                },
                                svg: SvgPicture.asset(
                                  "assets/svg/absen-ceklis.svg",
                                  fit: BoxFit.cover,
                                ),
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
