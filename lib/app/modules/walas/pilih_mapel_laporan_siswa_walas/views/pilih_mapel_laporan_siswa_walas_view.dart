import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/walas/detil_laporan_pelajaran_walas/views/detil_laporan_pelajaran_walas_view.dart';

import '../controllers/pilih_mapel_laporan_siswa_walas_controller.dart';

class PilihMapelLaporanSiswaWalasView
    extends GetView<PilihMapelLaporanSiswaWalasController> {
  const PilihMapelLaporanSiswaWalasView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PilihMapelLaporanSiswaWalasController());
    var arg = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        centerTitle: true,
        title: Text(
          arg["tanggal"] ?? "",
          style: AllMaterial.workSans(
            fontSize: 17,
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
      ),
      body: AllMaterial.containerLinear(
        padding: 0,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.detilAbsen.length,
                  itemBuilder: (context, index) {
                    var mapel = controller.detilAbsen[index];
                    if (controller.detilAbsen.isEmpty) {
                      return Center(
                        child: Text(
                          "Tidak ada detil laporan yang tersedia",
                          style: AllMaterial.workSans(
                              color: AllMaterial.colorGreySec),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: AllMaterial.menuJadwal(
                        context:
                            "Pukul ${AllMaterial.jamMenit(mapel["absen"]["jam"] ?? "")}",
                        title: "Jam ${mapel["mapel"]["nama"]}",
                        subtitleContext: "Status Absen :",
                        subtitle: mapel["absen"]["status"],
                        subtitleColor: mapel["absen"]["status"] == "tidak_hadir"
                            ? false
                            : true,
                        onTap: () {
                          Get.to(() => const DetilLaporanPelajaranWalasView(),
                              arguments: {
                                "tanggalAbsen":  arg["tanggal"],
                                "namaMapel": mapel["mapel"]["nama"],
                              });
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
      ),
    );
  }
}
