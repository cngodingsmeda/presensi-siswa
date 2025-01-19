import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';

import '../controllers/notifikasi_petugas_controller.dart';

class NotifikasiPetugasView extends GetView<NotifikasiPetugasController> {
  const NotifikasiPetugasView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AllMaterial.containerLinear(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Text(
                  "Notifikasi Saya",
                  style: AllMaterial.workSans(
                    fontSize: 17,
                    fontWeight: AllMaterial.fontSemiBold,
                  ),
                ),
                const SizedBox(height: 17),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Senin, 24 Januari 2025",
                      style: AllMaterial.workSans(
                        fontWeight: AllMaterial.fontMedium,
                        fontSize: 14,
                        color: AllMaterial.colorGreySec,
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: AllMaterial.notifWidget(
                            atas: "Absen Harian Berhasil!",
                            bawah:
                                "Anda telah melakukan absen harian di jam ke-2 pada 23/01/2025 - 08:30",
                            onTap: () {
                              AllMaterial.detilKonten(
                                buttonLabel: "Tutup Notifikasi",
                                title: "Absen Harian berhasil!",
                                subtitle:
                                    "Anda telah melakukan absen harian untuk mata pelajaran Matematika pada pukul 07:25!",
                                icon: const Icon(
                                  Icons.clear,
                                  color: AllMaterial.colorWhite,
                                ),
                                onTap: () => Get.back(),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
