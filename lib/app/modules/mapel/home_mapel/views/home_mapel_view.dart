import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/modules/mapel/detil_kelas_diajar_mapel/views/detil_kelas_diajar_mapel_view.dart';
import 'package:presensi_siswa/app/modules/mapel/main_mapel/controllers/main_mapel_controller.dart';
import 'package:presensi_siswa/app/widget/hero_image/hero_image.dart';

import '../controllers/home_mapel_controller.dart';

class HomeMapelView extends GetView<HomeMapelController> {
  const HomeMapelView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(HomeMapelController());
    final mainCont = Get.put(MainMapelController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: AllMaterial.containerLinear(
          padding: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
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
                          Obx(
                            () => mainCont.profilMapel.value?.data
                                            ?.fotoProfile ==
                                        "" ||
                                    mainCont.profilMapel.value?.data
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
                                : GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => HeroImage(
                                          
                                          imageUrl: mainCont.profilMapel.value
                                                  ?.data?.fotoProfile
                                                  ?.replaceAll("localhost",
                                                      ApiUrl.baseUrl) ??
                                              "https://picsum.photos/200/300?grayscale",
                                        ),
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                        color: AllMaterial.colorMint,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            mainCont.profilMapel.value?.data
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
                            Obx(
                              () => AllMaterial.outlineText(
                                title: "Nama Kelas",
                                subtitle: mainCont.statistikKelas.value?.data
                                        ?.kelas?.nama ??
                                    "-",
                              ),
                            ),
                            const SizedBox(width: 8),
                            Obx(
                              () => AllMaterial.outlineText(
                                title: "Jumlah Siswa",
                                subtitle:
                                    "${mainCont.statistikKelas.value?.data?.jumlahSiswa ?? 0} orang",
                              ),
                            ),
                            const SizedBox(width: 8),
                            Obx(
                              () => AllMaterial.outlineText(
                                  title: "Wali Kelas",
                                  subtitle: mainCont.statistikKelas.value?.data
                                          ?.kelas?.guruWalas?.nama ??
                                      "-"),
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
                      Obx(
                        () {
                          var histori =
                              mainCont.historiKelas.value?.data?.length ?? 0;
                          if (histori <= 0) {
                            print(histori);
                            return Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Center(
                                child: Text(
                                  "Tidak ada absen yang harus ditinjau",
                                  style: AllMaterial.workSans(
                                    color: AllMaterial.colorGreySec,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: histori > 3 ? 3 : histori,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: AllMaterial.cardWidget(
                                  tengah: mainCont.historiKelas.value
                                      ?.data?[index].kelas?.nama,
                                  atas: AllMaterial.hariTanggalBulanTahun(
                                      mainCont.historiKelas.value?.data?[index]
                                              .tanggal
                                              ?.toIso8601String() ??
                                          DateTime.now().toIso8601String()),
                                  bawah:
                                      "${mainCont.historiKelas.value?.data?[index].jumlahHadir ?? 0} Orang hadir",
                                  onTap: () {
                                    Get.to(
                                        () => const DetilKelasDiajarMapelView(),
                                        arguments: {
                                          "namaKelas": mainCont.historiKelas
                                              .value?.data?[index].kelas?.nama,
                                          "tanggal": mainCont.historiKelas.value
                                              ?.data?[index].tanggal,
                                          "jumlahHadir": mainCont
                                                  .historiKelas
                                                  .value
                                                  ?.data?[index]
                                                  .jumlahHadir ??
                                              0,
                                          "idKelas": mainCont.historiKelas.value
                                                  ?.data?[index].kelas?.id ??
                                              0
                                        });
                                  },
                                  svg: SvgPicture.asset(
                                    "assets/svg/absen-ceklis.svg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
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
