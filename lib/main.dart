import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/app/modules/login_page/views/login_page_view.dart';
import 'package:presensi_siswa/app/widget/custom_splash.dart';

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
    // var logController = Get.put(LoginPageController());
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CusplashScreen();
        } else {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual,
            overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
          );
          // logController.checkAuthentication();
          // return PopScope(
          //   canPop: true,
          //   child: Obx(
          //     () {
          //       if (logController.isAuth.value) {
          //         return logController.periksaRole();
          //       } else {
          //         return const LoginPageView();
          //       }
          //     },
          //   ),
          // );
          return const LoginPageView();
        }
      },
    );
  }
}
