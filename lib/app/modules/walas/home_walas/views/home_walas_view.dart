import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';
import 'package:presensi_siswa/app/modules/walas/absen_harian_siswa_walas/views/absen_harian_siswa_walas_view.dart';
import 'package:presensi_siswa/app/modules/walas/main_walas/controllers/main_walas_controller.dart';
import 'package:presensi_siswa/app/modules/walas/pilih_mapel_laporan_siswa_walas/views/pilih_mapel_laporan_siswa_walas_view.dart';
import 'package:presensi_siswa/app/widget/hero_image/hero_image.dart';

import '../controllers/home_walas_controller.dart';

class HomeWalasView extends GetView<HomeWalasController> {
  const HomeWalasView({super.key});
  @override
  Widget build(BuildContext context) {
    final mainCont = Get.put(MainWalasController());
    var kelas = mainCont.profilWalas.value?.data?.kelas?.nama;
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
                                "Wali Kelas",
                                style: AllMaterial.workSans(
                                  fontWeight: AllMaterial.fontSemiBold,
                                  fontSize: 20,
                                  color: AllMaterial.colorBlack,
                                ),
                              ),
                            ],
                          ),
                          Obx(
                            () => mainCont.profilWalas.value?.data
                                            ?.fotoProfile ==
                                        "" ||
                                    mainCont.profilWalas.value?.data
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
                                          namePath:
                                              "${mainCont.profilWalas.value?.data?.nama?.replaceAll(" ", "-")}-fotoProfile",
                                          imageUrl: mainCont.profilWalas.value
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
                                            mainCont.profilWalas.value?.data
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
                      const SizedBox(height: 17),
                      Material(
                        color: const Color(0xffF7FFFA),
                        borderRadius: BorderRadius.circular(35),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(35),
                          onTap: () {
                            Get.to(() => const AbsenHarianSiswaWalasView());
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
                                "Absen Harian Siswa",
                                style: AllMaterial.workSans(
                                  fontWeight: AllMaterial.fontSemiBold,
                                  color: AllMaterial.colorBlack,
                                ),
                              ),
                              subtitle: Text(
                                "Kelas $kelas",
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
                        "$kelas Hari Ini",
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
                                title: "Jumlah Siswa",
                                subtitle: "${mainCont.jumlahSiswa.value} orang",
                              ),
                            ),
                            const SizedBox(width: 8),
                            Obx(
                              () => AllMaterial.outlineText(
                                title: "Siswa Hadir",
                                subtitle: "${mainCont.siswaHadir.value} orang",
                              ),
                            ),
                            const SizedBox(width: 8),
                            Obx(
                              () => AllMaterial.outlineText(
                                title: "Siswa Tanpa Keterangan",
                                subtitle: "${mainCont.siswaAlpa.value} orang",
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Histori Absen Siswa",
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
                            atas: "Absen Hadir",
                            tengah: "Senin, 24 Agustus 2024",
                            bawah: "Senin, 24 Agustus 2024",
                            onTap: () {
                              Get.to(() =>
                                  const PilihMapelLaporanSiswaWalasView());
                            },
                            svg: SvgPicture.asset(
                              "assets/svg/absen-ceklis.svg",
                              fit: BoxFit.cover,
                            ),
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
