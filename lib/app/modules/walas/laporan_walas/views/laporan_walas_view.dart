import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/walas/pilih_mapel_laporan_siswa_walas/views/pilih_mapel_laporan_siswa_walas_view.dart';

import '../controllers/laporan_walas_controller.dart';

class LaporanWalasView extends GetView<LaporanWalasController> {
  const LaporanWalasView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LaporanWalasController());
    return Scaffold(
      body: AllMaterial.containerLinear(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Text(
                  "Laporan Siswa",
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
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: AllMaterial.cardWidget(
                            atas: "Absen XI RPL 1",
                            tengah: "Senin, 24 Agustus 2024",
                            bawah: "SMK Negeri 2 Mataram",
                            onTap: () {
                              Get.to(() =>
                                  const PilihMapelLaporanSiswaWalasView());
                            },
                            svg:
                                SvgPicture.asset("assets/svg/absen-ceklis.svg"),
                          ),
                        );
                      }),
                ),
                // Expanded(
                //   child: Obx(
                //     () => controller.absen.isNotEmpty
                //         ? ListView.builder(
                //             itemCount: controller.absen.length,
                //             itemBuilder: (context, index) {
                //               return Padding(
                //                 padding: const EdgeInsets.only(top: 16),
                //                 child: AllMaterial.cardWidget(
                //                   atas: "Absen Hadir",
                //                   tengah: "Senin, 24 Agustus 2024",
                //                   bawah: "SMK Negeri 2 Mataram",
                //                   onTap: () {
                //                     // Get.to(() => const DetilLaporanSiswaView());
                //                   },
                //                   svg: SvgPicture.asset(
                //                       "assets/svg/absen-ceklis.svg"),
                //                 ),
                //               );
                //             },
                //           )
                //         : Center(
                //             child: Text(
                //               "Tidak ada Laporan Siswa untuk bulan ini",
                //               style: AllMaterial.workSans(
                //                 color: AllMaterial.colorGreySec,
                //               ),
                //             ),
                //           ),
                //   ),
                // ),
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
  final LaporanWalasController controller;

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
