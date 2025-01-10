import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';

import '../controllers/buat_absen_harian_siswa_controller.dart';

class BuatAbsenHarianSiswaView extends GetView<BuatAbsenHarianSiswaController> {
  const BuatAbsenHarianSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BuatAbsenHarianSiswaController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      resizeToAvoidBottomInset: true,
      body: AllMaterial.containerLinear(
        padding: 0,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      "Absen Harian",
                      style: AllMaterial.workSans(
                        fontSize: 17,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          AllMaterial.editableWidget(
                            controller: controller.namaC,
                            focusNode: controller.namaF,
                            label: "Hari Absen",
                          ),
                          AllMaterial.editableWidget(
                            controller: controller.nisC,
                            focusNode: controller.nisF,
                            label: "Jam Absen Saat Ini",
                          ),
                          AllMaterial.editableWidget(
                            controller: controller.emailC,
                            focusNode: controller.emailF,
                            label: "Jenis Absen",
                          ),
                          AllMaterial.editableWidget(
                            controller: controller.jenisKelaminC,
                            focusNode: controller.jenisKelaminF,
                            label: "Deskripsi",
                            maxLines: 4,
                          ),
                          AllMaterial.editableWidget(
                            controller: controller.kelasJurusanC,
                            focusNode: controller.kelasJurusanF,
                            label: "Bukti Dokumen",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: AllMaterial.colorWhite,
          boxShadow: [AllMaterial.topShadow],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  MdiIcons.mapMarker,
                  color: AllMaterial.colorPrimary,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    "SMK Negeri 2 Mataram",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AllMaterial.workSans(
                      color: AllMaterial.colorBlack,
                      fontSize: 16,
                      fontWeight: AllMaterial.fontMedium,
                    ),
                  ),
                ),
              ],
            ),
            Column(
                children: List.generate(
              3,
              (index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "${controller.mapel[index]} (${controller.jam[index]})",
                        style: AllMaterial.workSans(
                          fontWeight: AllMaterial.fontRegular,
                          fontSize: 14,
                          color: AllMaterial.colorGreySec,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.check,
                          color: AllMaterial.colorPrimary,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          "Terisi",
                          style: AllMaterial.workSans(
                            fontWeight: AllMaterial.fontMedium,
                            fontSize: 15,
                            color: AllMaterial.colorBlack,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            )),
            const SizedBox(height: 20),
            AllMaterial.cusButton(
              onTap: () {
                Get.to(() => const BuatAbsenHarianSiswaView());
              },
              label: "Kirim Absen",
              icon: const Icon(
                Icons.send,
                color: AllMaterial.colorWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
