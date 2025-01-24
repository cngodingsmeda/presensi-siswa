import 'package:get/get.dart';
import 'package:presensi_siswa/app/model/model_siswa/profil_siswa_model.dart';

class ProfilSiswaController extends GetxController {
  var isLoading = true.obs;
   var statusCode = 0.obs;
   var profilSiswa = Rx<ProfileSiswaModel?>(null);
}
