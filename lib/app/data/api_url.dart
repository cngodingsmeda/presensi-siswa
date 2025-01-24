// import 'package:http/http.dart' as http;

abstract class ApiUrl {
  // PUBLIC
  static var baseUrl = "10.0.2.2";
  static var url = "http://$baseUrl:2008";
  static var mapel = "guruMapel";
  static var petugas = "petugasBk";
  static var siswa = "siswa";
  static var walas = "guruWalas";

  // ALL
  static var urlPostLogin = "$url/auth/public/login";
  static var urlPostLogout = "$url/auth/logout";

  // PETUGAS
  static var urlGetProfilePetugas = "$url/petugasBK/profile";
  static var urlGetStatistikTinjauanPetugas =
      "$url/petugasBK/absen/statistik-tinjauan";
  static var urlGetKelasTinjauanPetugas = "$url/petugasBK/absen/kelas-tinjauan";
  static String getAbsenByKelasTinjauanPetugas(String tanggal, String idKelas) {
    return "$url/petugasBK/absen/byKelas?tanggal=$tanggal&id_kelas=$idKelas";
  }

  // SISWA
  static var urlGetProfileSiswa = "$url/";
}
