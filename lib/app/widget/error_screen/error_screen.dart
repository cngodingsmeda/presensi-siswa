import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:restart_app/restart_app.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen({
    super.key,
    required this.statusCode,
    required this.child,
    required this.isLoading,
    required this.value,
    required this.role,
  });
  int statusCode;
  String role;
  Widget child;
  RxBool isLoading;
  dynamic value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: Obx(() {
        if (isLoading.value) {
          return splashWait(statusCode);
          // ignore: unnecessary_null_comparison
        } else if (value != null) {
          return child;
        } else {
          return buildErrorScreen(statusCode);
        }
      }),
    );
  }
}

Widget buildErrorScreen(int statusCode) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, color: Colors.red, size: 50),
        const SizedBox(height: 15),
        Text(
          AllMaterial.getErrorMessage(statusCode),
          textAlign: TextAlign.center,
          style: AllMaterial.workSans(
            fontSize: 18,
            fontWeight: AllMaterial.fontMedium,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildRetryButton(),
            const SizedBox(width: 15),
            buildExitButton(),
          ],
        ),
      ],
    ),
  );
}

Widget splashWait(int statusCode) {
  return FutureBuilder(
    future: Future.delayed(const Duration(seconds: 5)),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: CircularProgressIndicator(
                color: AllMaterial.colorPrimary,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Mohon tunggu sebentar...",
              style: AllMaterial.workSans(
                fontWeight: AllMaterial.fontSemiBold,
              ),
            ),
          ],
        );
      } else {
        return buildErrorScreen(statusCode);
      }
    },
  );
}

ElevatedButton buildRetryButton() {
  return ElevatedButton(
    onPressed: () {
      Restart.restartApp();
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: AllMaterial.colorPrimary,
      side: const BorderSide(color: AllMaterial.colorWhite),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    child: Text(
      "Coba Lagi",
      style: AllMaterial.workSans(
        color: AllMaterial.colorWhite,
        fontWeight: AllMaterial.fontMedium,
      ),
    ),
  );
}

ElevatedButton buildExitButton() {
  return ElevatedButton(
    onPressed: () {
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else if (Platform.isIOS) {
        exit(0);
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: AllMaterial.colorPrimary,
      side: const BorderSide(color: AllMaterial.colorWhite),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    child: Text(
      "Keluar",
      style: AllMaterial.workSans(
        color: AllMaterial.colorWhite,
        fontWeight: AllMaterial.fontMedium,
      ),
    ),
  );
}
