import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:presensi_siswa/all_material.dart';
import 'package:presensi_siswa/app/data/api_url.dart';

class FileHandler {
  static Future<void> openFile(String filePath) async {
    await Permission.storage.request();
    try {
      String localPath = filePath.replaceAll("localhost", ApiUrl.baseUrl);
      final result = await OpenFilex.open(localPath);
      if (result.type != ResultType.done) {
        Get.back();
        AllMaterial.messageScaffold(title: result.message);

        // openAppSettings();
      }
    } catch (e) {
      print("Exception when opening file: $e");
    }
  }
}
