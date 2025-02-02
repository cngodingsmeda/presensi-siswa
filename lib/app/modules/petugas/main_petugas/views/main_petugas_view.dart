import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/modules/petugas/home_petugas/views/home_petugas_view.dart';
import 'package:presensi_siswa/app/modules/petugas/laporan_petugas/views/laporan_petugas_view.dart';
import 'package:presensi_siswa/app/modules/petugas/notifikasi_petugas/views/notifikasi_petugas_view.dart';
import 'package:presensi_siswa/app/modules/petugas/profil_petugas/views/profil_petugas_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../controllers/main_petugas_controller.dart';

class MainPetugasView extends GetView<MainPetugasController> {
  const MainPetugasView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainPetugasController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.currentIndexBar.value = value;
        },
        children: const [
          // NAVIGASI HOME
          HomePetugasView(),

          // NAVIGASI LAPORAN
          LaporanPetugasView(),

          // NAVIGASI NOTIFIKASI
          NotifikasiPetugasView(),

          // NAVIGASI PROFIL
          ProfilPetugasView()
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
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    MdiIcons.bellOutline,
                    color: AllMaterial.colorBlack.withOpacity(0.15),
                  ),
                  Obx(
                    () => controller.unreadNotifications.value > 0
                        ? Positioned(
                            right: -6,
                            top: -6,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: AllMaterial.colorRed,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                controller.unreadNotifications.value.toString(),
                                style: AllMaterial.workSans(
                                  color: AllMaterial.colorWhite,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
              activeIcon: Icon(MdiIcons.bell),
              title: Text(
                "Notifikasi",
                style: AllMaterial.workSans(color: AllMaterial.colorPrimary),
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
