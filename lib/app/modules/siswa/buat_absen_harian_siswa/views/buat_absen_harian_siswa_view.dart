import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/siswa/absen_harian_siswa/controllers/absen_harian_siswa_controller.dart';

import '../controllers/buat_absen_harian_siswa_controller.dart';

class BuatAbsenHarianSiswaView extends GetView<BuatAbsenHarianSiswaController> {
  const BuatAbsenHarianSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BuatAbsenHarianSiswaController());
    final absenCont = Get.put(AbsenHarianSiswaController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          "Buat Absen Harian",
          style: AllMaterial.workSans(
            fontSize: 17,
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                AllMaterial.editableWidget(
                  controller: controller.hariC,
                  focusNode: controller.hariF,
                  label: "Hari Absen",
                  readOnly: true,
                ),
                AllMaterial.editableWidget(
                  controller: controller.jamC,
                  focusNode: controller.jamF,
                  label: "Jam Absen Saat Ini",
                  readOnly: true,
                ),
                AllMaterial.dropDownWidget(
                  dropdownItems: [
                    "Absen Hadir",
                    "Absen Dispensasi",
                    "Absen Izin",
                    "Absen Izin Telat",
                    "Absen Telat",
                    "Absen Sakit"
                  ],
                  hintText: "Absen Hadir",
                  onChanged: (value) {},
                  selectedValue: "Absen Hadir",
                  controller: controller.jenisAbsenC,
                  focusNode: controller.jenisAbsenF,
                  label: "Jenis Absen",
                ),
                AllMaterial.editableWidget(
                  controller: TextEditingController(),
                  focusNode: FocusNode(),
                  label: "Deskripsi",
                  hintText: "Masukkan Deskripsi Absen...",
                  maxLines: 4,
                ),
                Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bukti Dokumen",
                        style: AllMaterial.workSans(
                          fontWeight: AllMaterial.fontMedium,
                          fontSize: 14,
                          color: AllMaterial.colorGreySec,
                        ),
                      ),
                      const SizedBox(height: 6),
                      GestureDetector(
                        onTap: () {
                          controller.showImageSourceDialog();
                        },
                        child: Container(
                          width: Get.width,
                          margin: const EdgeInsets.only(bottom: 25),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffEDF2EE)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                controller.selectedFile.value != null
                                    ? controller.selectedFile.value!.path
                                                .endsWith(".pdf") ||
                                            controller.selectedFile.value!.path
                                                .endsWith(".doc") ||
                                            controller.selectedFile.value!.path
                                                .endsWith(".docx")
                                        ? Icons.attach_file
                                        : Icons.image
                                    : Icons.add,
                                color: AllMaterial.colorPrimary,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  controller.selectedFile.value != null
                                      ? controller.selectedFile.value!.path
                                          .split('/')
                                          .last
                                      : "Pilih file atau dokumen",
                                  style: AllMaterial.workSans(
                                    fontWeight: AllMaterial.fontRegular,
                                    fontSize: 14,
                                    color: AllMaterial.colorGreySec,
                                  ),
                                ),
                              ),
                              if (controller.selectedFile.value != null)
                                IconButton(
                                  icon: const Icon(
                                    Icons.clear,
                                    color: AllMaterial.colorRed,
                                  ),
                                  onPressed: () {
                                    controller.removeFile();
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
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
                    controller.arg["lokasi"] ?? "",
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
            Obx(
              () => absenCont.jumlahMapel.value == 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Tidak ada jadwal untuk hari ini",
                        style: AllMaterial.workSans(
                          fontWeight: AllMaterial.fontMedium,
                          color: AllMaterial.colorGreySec,
                        ),
                      ),
                    )
                  : Column(
                      children: List.generate(
                          absenCont.jadwal.value?.data?.dataJadwal?.length ?? 0,
                          (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                "${absenCont.jadwal.value?.data?.dataJadwal?[index].jadwal?.mapel?.nama ?? ""} (${AllMaterial.jamMenit(absenCont.jadwal.value?.data?.dataJadwal?[index].jadwal?.jamMulai ?? "")}-${AllMaterial.jamMenit(absenCont.jadwal.value?.data?.dataJadwal?[index].jadwal?.jamSelesai ?? "")})",
                                style: AllMaterial.workSans(
                                  fontWeight: AllMaterial.fontRegular,
                                  fontSize: 14,
                                  color: AllMaterial.colorGreySec,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                absenCont.jadwal.value?.data?.dataJadwal?[index]
                                            .isAbsen ==
                                        true
                                    ? const Icon(
                                        Icons.check,
                                        color: AllMaterial.colorPrimary,
                                      )
                                    : const Icon(
                                        Icons.clear,
                                        color: AllMaterial.colorRed,
                                      ),
                                const SizedBox(width: 2),
                                Text(
                                  absenCont.jadwal.value?.data
                                              ?.dataJadwal?[index].isAbsen ==
                                          true
                                      ? "Terisi"
                                      : "Belum",
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
                      }),
                    ),
            ),
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
