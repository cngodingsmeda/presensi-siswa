import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';

import '../controllers/detil_kelas_diajar_mapel_controller.dart';

class DetilKelasDiajarMapelView
    extends GetView<DetilKelasDiajarMapelController> {
  const DetilKelasDiajarMapelView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetilKelasDiajarMapelController());
    var arg = Get.arguments;
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "$arg - Matematika",
              style: AllMaterial.workSans(
                color: AllMaterial.colorPrimary,
                fontWeight: AllMaterial.fontSemiBold,
                fontSize: 14,
              ),
            ),
            Text(
              "Senin, 25 Agustus 2024",
              style: AllMaterial.workSans(
                color: AllMaterial.colorGreySec,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AllMaterial.outlineText(
                              title: "Siswa Hadir",
                              subtitle: "30 orang",
                            ),
                            const SizedBox(width: 8),
                            AllMaterial.outlineText(
                              title: "Waktu Belajar",
                              subtitle: "120 Menit",
                            ),
                            const SizedBox(width: 8),
                            AllMaterial.outlineText(
                              title: "Guru Walas",
                              subtitle: "Heri Harjanto S.Pd",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          4,
                          (index) {
                            List<String> statuses = [
                              "Hadir",
                              "Alpa",
                              "Izin",
                              "Sakit",
                            ];
                            String status = statuses[index];

                            Color borderColor;
                            IconData? widget;

                            if (status == "Hadir") {
                              borderColor = AllMaterial.colorPrimary;
                              widget = Icons.check;
                            } else if (status == "Izin") {
                              borderColor = AllMaterial.colorBlue;
                              widget = MdiIcons.fileChart;
                            } else if (status == "Alpa") {
                              borderColor = AllMaterial.colorRed;
                              widget = MdiIcons.close;
                            } else if (status == "Sakit") {
                              widget = MdiIcons.clipboardPlus;
                              borderColor = AllMaterial.colorMint;
                            } else {
                              borderColor = Colors.grey;
                            }

                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  widget,
                                  color: borderColor,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "= $status",
                                  style: AllMaterial.workSans(
                                    fontWeight: AllMaterial.fontRegular,
                                    fontSize: 14,
                                    color: AllMaterial.colorGreySec,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      Column(
                        children: List.generate(
                          controller.nama.length,
                          (index) {
                            return Column(
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  minVerticalPadding: 0,
                                  leading: Text(
                                    "${index + 1}.",
                                    style: AllMaterial.workSans(
                                      fontWeight: AllMaterial.fontBold,
                                      fontSize: 15,
                                      color: AllMaterial.colorBlack,
                                    ),
                                  ),
                                  title: Text(
                                    controller.nama[index],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AllMaterial.workSans(
                                      fontWeight: AllMaterial.fontRegular,
                                      fontSize: 14,
                                      color: AllMaterial.colorGreySec,
                                    ),
                                  ),
                                  trailing: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color: AllMaterial.colorPrimary,
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    AllMaterial.detilKonten(
                                      buttonLabel: "Tutup Laporan",
                                      title: "Absen Harian",
                                      addSubtitle: false,
                                      icon: const Icon(
                                        Icons.clear,
                                        color: AllMaterial.colorWhite,
                                      ),
                                      onTap: () => Get.back(),
                                      konten: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child:
                                                    AllMaterial.contextWidget(
                                                  icon: MdiIcons.mapMarker,
                                                  subtitle: "Lokasi Absen",
                                                  title: "SMK Negeri 2 Mataram",
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child:
                                                    AllMaterial.contextWidget(
                                                  icon: MdiIcons.clock,
                                                  subtitle: "Waktu Absen",
                                                  title:
                                                      "Pukul ${controller.jamAbsen[index]}",
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child:
                                                    AllMaterial.contextWidget(
                                                  icon: MdiIcons.account,
                                                  subtitle: "Nama Siswa",
                                                  title: controller.nama[index],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child:
                                                    AllMaterial.contextWidget(
                                                  icon: MdiIcons.fingerprint,
                                                  subtitle: "Jenis Absen",
                                                  title: "Absen Hadir",
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Container(
                                            width: Get.width,
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                color: AllMaterial.colorStroke,
                                                width: 1.5,
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Deskripsi Absen",
                                                  style: AllMaterial.workSans(
                                                    fontSize: 17,
                                                    color: AllMaterial
                                                        .colorPrimary,
                                                    fontWeight: AllMaterial
                                                        .fontSemiBold,
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                Text(
                                                  "Tidak ada deskripsi yang ditambahkan.",
                                                  style: AllMaterial.workSans(
                                                    color: AllMaterial
                                                        .colorGreySec,
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                Text(
                                                  "Bukti Dokumen",
                                                  style: AllMaterial.workSans(
                                                    fontSize: 17,
                                                    color: AllMaterial
                                                        .colorPrimary,
                                                    fontWeight: AllMaterial
                                                        .fontSemiBold,
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                Text(
                                                  "Tidak ada bukti dokumen yang ditambahkan.",
                                                  style: AllMaterial.workSans(
                                                    color: AllMaterial
                                                        .colorGreySec,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                const Divider(
                                  color: AllMaterial.colorStroke,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(5),
                overlayColor: AllMaterial.colorPrimary,
              ),
              onPressed: () {},
              child: Text(
                "Sebelumnya",
                style: AllMaterial.workSans(
                  fontWeight: AllMaterial.fontMedium,
                  fontSize: 14,
                  color: AllMaterial.colorPrimary,
                ),
              ),
            ),
            Text(
              "10 dari 32",
              style: AllMaterial.workSans(
                fontSize: 14,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(5),
                overlayColor: AllMaterial.colorPrimary,
              ),
              onPressed: () {},
              child: Text(
                "Selanjutnya",
                style: AllMaterial.workSans(
                  fontWeight: AllMaterial.fontMedium,
                  fontSize: 14,
                  color: AllMaterial.colorPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
