import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/siswa/detil_laporan_siswa/views/detil_laporan_siswa_view.dart';
import 'package:presensi_siswa/app/modules/siswa/main_siswa/controllers/main_siswa_controller.dart';

import '../controllers/laporan_siswa_controller.dart';

class LaporanSiswaView extends GetView<LaporanSiswaController> {
  const LaporanSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LaporanSiswaController());
    final mainC = Get.put(MainSiswaController());
    return Scaffold(
      body: AllMaterial.containerLinear(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Text(
                  "Laporan Saya",
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
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (controller.absensiList.isEmpty) {
                      return Center(
                        child: Text(
                          "Tidak ada laporan absensi pada bulan ini",
                          style: AllMaterial.workSans(
                              color: AllMaterial.colorGreySec),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: controller.absensiList.length,
                      itemBuilder: (context, index) {
                        final absenData = controller.absensiList[index];
                        final absen = absenData['absen'];
                        print(mainC.profilSiswa.value?.data?.sekolah?.nama);
                        return Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Obx(
                            () => AllMaterial.cardWidget(
                              atas: "Absen Bulanan",
                              tengah: AllMaterial.hariTanggalBulanTahun(
                                absen['tanggal'],
                              ),
                              bawah: mainC
                                      .profilSiswa.value?.data?.sekolah?.nama ??
                                  "",
                              svg: SvgPicture.asset(
                                "assets/svg/absen-ceklis.svg",
                              ),
                              onTap: () {
                                Get.to(() => const DetilLaporanSiswaView(),
                                    arguments: {
                                      "tanggal":
                                          AllMaterial.hariTanggalBulanTahun(
                                        absen['tanggal'],
                                      ),
                                      "keyTanggal": absenData,
                                    });
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }),
                )
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
  final LaporanSiswaController controller;

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
