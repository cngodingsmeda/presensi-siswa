import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/siswa/home_siswa/views/home_siswa_view.dart';
import 'package:presensi_siswa/app/modules/siswa/laporan_siswa/views/laporan_siswa_view.dart';
import 'package:presensi_siswa/app/modules/siswa/notifikasi_siswa/views/notifikasi_siswa_view.dart';
import 'package:presensi_siswa/app/modules/siswa/profil_siswa/views/profil_siswa_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../controllers/main_siswa_controller.dart';

class MainSiswaView extends GetView<MainSiswaController> {
  const MainSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = MainSiswaController();

    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.currentIndexBar.value = value;
        },
        children: const [
          // NAVIGASI HOME
          HomeSiswaView(),

          // NAVIGASI LAPORAN
          LaporanSiswaView(),

          // NAVIGASI NOTIFIKASI
          NotifikasiSiswaView(),

          // NAVIGASI PROFIL
          ProfilSiswaView(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
          margin: const EdgeInsets.only(top: 10, bottom: 15),
          backgroundColor: AllMaterial.colorWhite,
          currentIndex: controller.currentIndexBar.value,
          onTap: (index) {
            controller.currentIndexBar.value = index;
            controller.pageController.jumpToPage(index);
          },
          items: [
            // Beranda
            SalomonBottomBarItem(
              icon: Icon(
                MdiIcons.homeVariantOutline,
                color: AllMaterial.colorBlack.withOpacity(0.15),
              ),
              activeIcon: Icon(MdiIcons.homeVariant),
              title: Text(
                "Beranda",
                style: AllMaterial.workSans(
                  color: AllMaterial.colorPrimary,
                ),
              ),
              selectedColor: AllMaterial.colorPrimary,
            ),

            // Laporan
            SalomonBottomBarItem(
              icon: Icon(
                MdiIcons.chartBoxOutline,
                color: AllMaterial.colorBlack.withOpacity(0.15),
              ),
              activeIcon: Icon(MdiIcons.chartBox),
              title: Text(
                "Laporan",
                style: AllMaterial.workSans(
                  color: AllMaterial.colorPrimary,
                ),
              ),
              selectedColor: AllMaterial.colorPrimary,
            ),

            // Notifikasi
            SalomonBottomBarItem(
              icon: Icon(
                MdiIcons.bellOutline,
                color: AllMaterial.colorBlack.withOpacity(0.15),
              ),
              activeIcon: Icon(MdiIcons.bell),
              title: Text(
                "Notifikasi",
                style: AllMaterial.workSans(
                  color: AllMaterial.colorPrimary,
                ),
              ),
              selectedColor: AllMaterial.colorPrimary,
            ),

            // Profil
            SalomonBottomBarItem(
              icon: Icon(
                MdiIcons.accountOutline,
                color: AllMaterial.colorBlack.withOpacity(0.15),
              ),
              activeIcon: Icon(MdiIcons.account),
              title: Text(
                "Profil",
                style: AllMaterial.workSans(
                  color: AllMaterial.colorPrimary,
                ),
              ),
              selectedColor: AllMaterial.colorPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
