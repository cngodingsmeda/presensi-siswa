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
  static var urlGetHistoriTinjauanPetugas = "$url/petugasBK/absen/histori-tinjauan";
  static var urlGetDetilHistoriTinjauanPetugas = "$url/petugasBK/absen/detail";
  static var urlPatchTinjauAbsenPetugas = "$url/petugasBK/absen/tinjau";
  static String getAbsenByKelasTinjauanPetugas(String tanggal, String idKelas, String page) {
    return "$url/petugasBK/absen/byKelas?tanggal=$tanggal&id_kelas=$idKelas&page=$page";
  }
  static String getAbsenSiswaByIdPetugas(String tanggal, String idSiswa) {
    return "$url/petugasBK/absen/bySiswa?tanggal=$tanggal&id_siswa=$idSiswa";
  }

  // SISWA
  static var urlGetProfileSiswa = "$url/siswa/profile";
  static var urlGetRekapAbsenMingguanSiswa =
      "$url/siswa/absen/rekap-mingguan";
  static var urlGetJadwalAbsenTodaySiswa =
      "$url/siswa/jadwal/today";
  static var urlGetAvailableAbsenTodaySiswa =
      "$url/siswa/absen/cekAbsen";
  static var urlGetJadwalHariAbsenSiswa =
      "$url/siswa/jadwal/getHariContainstJadwal";
  static var urlPostKoordinatAbsenSiswa =
      "$url/siswa/koordinat-absen/cek";
}
