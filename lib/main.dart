import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/app/custom_splash.dart';
import 'package:presensi_siswa/app/modules/home/views/home_view.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Presisi - Presensi Siswa",
      getPages: AppPages.routes,
      locale: const Locale('id_ID'),
      debugShowCheckedModeBanner: false,
      home: const InitPage(),
    ),
  );
}

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeView();
        } else {
          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual,
            overlays: [SystemUiOverlay.top],
          );
          return const CusplashScreen();
        }
      },
    );
  }
}
