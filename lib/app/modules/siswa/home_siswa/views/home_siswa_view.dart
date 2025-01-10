import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/siswa/absen_harian_siswa/views/absen_harian_siswa_view.dart';
import 'package:presensi_siswa/app/modules/siswa/detil_laporan_siswa/views/detil_laporan_siswa_view.dart';

import '../controllers/home_siswa_controller.dart';

class HomeSiswaView extends GetView<HomeSiswaController> {
  const HomeSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                "Siswa",
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
                      const SizedBox(height: 17),
                      Material(
                        color: const Color(0xffF7FFFA),
                        borderRadius: BorderRadius.circular(35),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(35),
                          onTap: () => Get.to(
                            () => const AbsenHarianSiswaView(),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              border: Border.all(
                                color: AllMaterial.colorStroke,
                                width: 1,
                              ),
                            ),
                            child: ListTile(
                              minVerticalPadding: 0,
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                radius: 22,
                                backgroundColor: AllMaterial.colorSecondary,
                                child:
                                    SvgPicture.asset("assets/svg/calendar.svg"),
                              ),
                              title: Text(
                                "Absen Harian",
                                style: AllMaterial.workSans(
                                  fontWeight: AllMaterial.fontSemiBold,
                                  color: AllMaterial.colorBlack,
                                ),
                              ),
                              subtitle: Text(
                                "Senin, 24 Januari 2025",
                                style: AllMaterial.workSans(
                                  color: AllMaterial.colorGreySec,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AllMaterial.colorPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 23),
                Container(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rekap Seluruh Absen",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AllMaterial.outlineText(
                              title: "Absen Hadir",
                              subtitle: "10x",
                            ),
                            const SizedBox(width: 8),
                            AllMaterial.outlineText(
                              title: "Absen Sakit",
                              subtitle: "2x",
                            ),
                            const SizedBox(width: 8),
                            AllMaterial.outlineText(
                              title: "Absen Izin/Telat/Dispensasi",
                              subtitle: "0x",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(2),
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Histori Absen",
                                style: AllMaterial.workSans(
                                  fontWeight: AllMaterial.fontMedium,
                                  fontSize: 14,
                                  color: AllMaterial.colorGreySec,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AllMaterial.colorPrimary,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: AllMaterial.cardWidget(
                            atas: "Absen Hadir",
                            tengah: "Senin, 24 Agustus 2024",
                            bawah: "SMK Negeri 2 Mataram",
                            onTap: () {
                              Get.to(() => const DetilLaporanSiswaView());
                            },
                            svg:
                                SvgPicture.asset("assets/svg/absen-ceklis.svg"),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
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
