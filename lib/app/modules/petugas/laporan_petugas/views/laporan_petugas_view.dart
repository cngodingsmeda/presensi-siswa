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
    final controller = Get.put(LaporanPetugasController());
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ChoiceChipWidget(
                        controller: controller,
                        label: 'Juli',
                        month: 7,
                      ),
                      const SizedBox(width: 8),
                      ChoiceChipWidget(
                        controller: controller,
                        label: 'Agustus',
                        month: 8,
                      ),
                      const SizedBox(width: 8),
                      ChoiceChipWidget(
                        controller: controller,
                        label: 'September',
                        month: 9,
                      ),
                      const SizedBox(width: 8),
                      ChoiceChipWidget(
                        controller: controller,
                        label: 'Oktober',
                        month: 10,
                      ),
                      const SizedBox(width: 8),
                      ChoiceChipWidget(
                        controller: controller,
                        label: 'November',
                        month: 11,
                      ),
                      const SizedBox(width: 8),
                      ChoiceChipWidget(
                        controller: controller,
                        label: 'Desember',
                        month: 12,
                      ),
                      const SizedBox(width: 8),
                      ChoiceChipWidget(
                        controller: controller,
                        label: 'Januari',
                        month: 1,
                      ),
                      const SizedBox(width: 8),
                      ChoiceChipWidget(
                        controller: controller,
                        label: 'Februari',
                        month: 2,
                      ),
                      const SizedBox(width: 8),
                      ChoiceChipWidget(
                        controller: controller,
                        label: 'Maret',
                        month: 3,
                      ),
                      const SizedBox(width: 8),
                      ChoiceChipWidget(
                        controller: controller,
                        label: 'April',
                        month: 4,
                      ),
                      const SizedBox(width: 8),
                      ChoiceChipWidget(
                        controller: controller,
                        label: 'Mei',
                        month: 5,
                      ),
                      const SizedBox(width: 8),
                      ChoiceChipWidget(
                        controller: controller,
                        label: 'Juni',
                        month: 6,
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
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
                                atas: "Absen ${controller.bulanIni}",
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
                                        "kelas": kelasTinjauan?.nama ?? "",
                                        "bulan": controller.bulanIni.value
                                      });
                                },
                                svg: SvgPicture.asset(
                                    "assets/svg/absen-ceklis.svg"),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                // const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChoiceChipWidget extends StatelessWidget {
  final String label;
  final int month;
  final LaporanPetugasController controller;

  const ChoiceChipWidget({
    super.key,
    required this.label,
    required this.month,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ChoiceChip(
        label: Text(label),
        checkmarkColor: AllMaterial.colorWhite,
        elevation: 0,
        disabledColor: AllMaterial.colorGreySec,
        shadowColor: Colors.transparent,
        side: const BorderSide(width: 0, color: Colors.transparent),
        selected: controller.selectedMonth.value == month,
        selectedColor: AllMaterial.colorPrimary,
        onSelected: (bool selected) {
          if (selected) {
            controller.updateHistoriAbsen(month);
            controller.bulanIni.value = label;
          }
        },
        backgroundColor: const Color(0xffECFAF0),
        labelStyle: AllMaterial.workSans(
          color: controller.selectedMonth.value == month
              ? Colors.white
              : AllMaterial.colorPrimary,
          fontWeight: controller.selectedMonth.value == month
              ? AllMaterial.fontMedium
              : AllMaterial.fontRegular,
        ),
      ),
    );
  }
}
