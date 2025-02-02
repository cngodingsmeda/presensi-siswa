import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/modules/siswa/absen_harian_siswa/views/absen_harian_siswa_view.dart';
import 'package:presensi_siswa/app/modules/siswa/detil_laporan_siswa/views/detil_laporan_siswa_view.dart';
import 'package:presensi_siswa/app/modules/siswa/main_siswa/controllers/main_siswa_controller.dart';

import '../controllers/home_siswa_controller.dart';

class HomeSiswaView extends GetView<HomeSiswaController> {
  const HomeSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    final mainCont = Get.put(MainSiswaController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: AllMaterial.containerLinear(
          padding: 0,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
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
                          Obx(
                            () => mainCont.profilSiswa.value?.data
                                            ?.fotoProfile ==
                                        "" ||
                                    mainCont.profilSiswa.value?.data
                                            ?.fotoProfile ==
                                        null
                                ? Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1000),
                                      color: AllMaterial.colorMint,
                                    ),
                                    child: Obx(
                                      () => Text(
                                        mainCont.userNameFilter.value,
                                        style: AllMaterial.workSans(
                                          color: AllMaterial.colorWhite,
                                          fontWeight: AllMaterial.fontSemiBold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1000),
                                      color: AllMaterial.colorMint,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          mainCont.profilSiswa.value?.data
                                                  ?.fotoProfile
                                                  ?.replaceAll(
                                                "localhost",
                                                ApiUrl.baseUrl,
                                              ) ??
                                              "https://picsum.photos/200/300?grayscale",
                                        ),
                                      ),
                                    ),
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
                          onTap: () {
                            Get.to(
                              () => const AbsenHarianSiswaView(),
                            );
                          },
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
                                AllMaterial.hariTanggalBulanTahun(
                                    DateTime.now().toIso8601String()),
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
                        "Rekap Absen Mingguan",
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
                            Obx(
                              () => AllMaterial.outlineText(
                                title: "Absen Hadir",
                                subtitle: "${controller.absenHadir.value}x",
                              ),
                            ),
                            const SizedBox(width: 8),
                            Obx(
                              () => AllMaterial.outlineText(
                                title: "Absen Izin/Sakit/Dispensasi",
                                subtitle: "${controller.absenIzin.value}x",
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Histori Absen",
                        style: AllMaterial.workSans(
                          fontWeight: AllMaterial.fontMedium,
                          fontSize: 14,
                          color: AllMaterial.colorGreySec,
                        ),
                      ),
                      Obx(() {
                        if (mainCont.isLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (mainCont.absensiList.isEmpty) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                "Tidak ada histori absensi belakangan ini",
                                style: AllMaterial.workSans(
                                    color: AllMaterial.colorGreySec),
                              ),
                            ),
                          );
                        }

                        int itemCount = min(3, mainCont.absensiList.length);

                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: itemCount,
                          itemBuilder: (context, index) {
                            final absenData = mainCont.absensiList[index];
                            final absen = absenData['absen'];
                            return Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Obx(
                                () => AllMaterial.cardWidget(
                                  atas: "Absen Harian",
                                  tengah: AllMaterial.hariTanggalBulanTahun(
                                      absen['tanggal']),
                                  bawah: mainCont.profilSiswa.value?.data
                                          ?.sekolah?.nama ??
                                      "",
                                  svg: SvgPicture.asset(
                                      "assets/svg/absen-ceklis.svg"),
                                  onTap: () {
                                    print(absen["id"]);
                                    Get.to(() => const DetilLaporanSiswaView(),
                                        arguments: {
                                          "tanggal":
                                              AllMaterial.hariTanggalBulanTahun(
                                                  absen['tanggal']),
                                          "id": absen["id"],
                                        });
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      }),
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
