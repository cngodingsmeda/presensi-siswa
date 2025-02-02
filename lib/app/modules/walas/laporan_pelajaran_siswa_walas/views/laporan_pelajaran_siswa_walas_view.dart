import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';

import '../controllers/laporan_pelajaran_siswa_walas_controller.dart';

class LaporanPelajaranSiswaWalasView
    extends GetView<LaporanPelajaranSiswaWalasController> {
  const LaporanPelajaranSiswaWalasView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LaporanPelajaranSiswaWalasController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "XI RPL 1 - Habil Arlian Asrori",
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
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: AllMaterial.menuJadwal(
                      context: "Pukul ${controller.jam[index]}",
                      title: "Jam ${controller.mapel[index]}",
                      subtitleContext: "Guru Mapel :",
                      subtitle: controller.guru[index],
                      onTap: () {
                        AllMaterial.detilKonten(
                          buttonLabel: "Tutup Laporan",
                          title: "Senin, 25 Agustus 2024",
                          addSubtitle: false,
                          icon: const Icon(
                            Icons.clear,
                            color: AllMaterial.colorWhite,
                          ),
                          onTap: () => Get.back(),
                          konten: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: AllMaterial.contextWidget(
                                      icon: MdiIcons.mapMarker,
                                      subtitle: "Lokasi Absen",
                                      title: "SMK Negeri 2 Mataram",
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: AllMaterial.contextWidget(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: AllMaterial.contextWidget(
                                      icon: MdiIcons.account,
                                      subtitle: "Nama Siswa",
                                      title: controller.nama[index],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: AllMaterial.contextWidget(
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
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: AllMaterial.colorStroke,
                                    width: 1.5,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Deskripsi Absen",
                                      style: AllMaterial.workSans(
                                        fontSize: 17,
                                        color: AllMaterial.colorPrimary,
                                        fontWeight: AllMaterial.fontSemiBold,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "Tidak ada deskripsi yang ditambahkan.",
                                      style: AllMaterial.workSans(
                                        color: AllMaterial.colorGreySec,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "Bukti Dokumen",
                                      style: AllMaterial.workSans(
                                        fontSize: 17,
                                        color: AllMaterial.colorPrimary,
                                        fontWeight: AllMaterial.fontSemiBold,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "Tidak ada bukti dokumen yang ditambahkan.",
                                      style: AllMaterial.workSans(
                                        color: AllMaterial.colorGreySec,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Material(
                                color: Colors.transparent,
                                child: RichText(
                                  text: TextSpan(
                                    text: "Diverifikasi Oleh ",
                                    style: AllMaterial.workSans(
                                      color: AllMaterial.colorGreySec,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Sustri Ardika",
                                        style: AllMaterial.workSans(
                                          color: AllMaterial.colorPrimary,
                                          fontWeight: AllMaterial.fontSemiBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
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
    );
  }
}
