import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/mapel/detil_kelas_diajar_mapel/views/detil_kelas_diajar_mapel_view.dart';

import '../controllers/home_mapel_controller.dart';

class HomeMapelView extends GetView<HomeMapelController> {
  const HomeMapelView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeMapelController();
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: AllMaterial.containerLinear(
          padding: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Selamat datang,",
                                style: AllMaterial.workSans(
                                  fontWeight: AllMaterial.fontMedium,
                                  fontSize: 14,
                                  color: AllMaterial.colorGreySec,
                                ),
                              ),
                              Text(
                                "Guru Mapel",
                                style: AllMaterial.workSans(
                                  fontWeight: AllMaterial.fontSemiBold,
                                  fontSize: 20,
                                  color: AllMaterial.colorBlack,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              boxShadow: [AllMaterial.topShadow],
                              borderRadius: BorderRadius.circular(1000),
                              color: AllMaterial.colorMint,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 23),
                Container(
                  height: Get.height,
                  decoration: BoxDecoration(
                    boxShadow: [
                      AllMaterial.topShadow,
                    ],
                    color: AllMaterial.colorWhite,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kelas Diajar Saat Ini",
                        style: AllMaterial.workSans(
                          fontWeight: AllMaterial.fontMedium,
                          fontSize: 14,
                          color: AllMaterial.colorGreySec,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            AllMaterial.outlineText(
                              title: "Nama Kelas",
                              subtitle: "XI RPL 1",
                            ),
                            const SizedBox(width: 8),
                            AllMaterial.outlineText(
                              title: "Jumlah Siswa",
                              subtitle: "32 orang",
                            ),
                            const SizedBox(width: 8),
                            AllMaterial.outlineText(
                              title: "Wali Kelas",
                              subtitle: "Ratna S.pd",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Histori Kelas Diajar",
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
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: AllMaterial.cardWidget(
                            atas: "Senin, 24 Agustus 2024",
                            tengah: controller.kelas[index],
                            bawah: "32 Orang Hadir",
                            onTap: () {
                              Get.to(() => const DetilKelasDiajarMapelView(),
                                  arguments: controller.kelas[index]);
                            },
                            svg: SvgPicture.asset(
                              "assets/svg/absen-ceklis.svg",
                            ),
                          ),
                        ),
                      ),
                    ],
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
