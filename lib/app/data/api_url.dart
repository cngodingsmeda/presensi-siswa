// import 'package:http/http.dart' as http;

abstract class ApiUrl {
  // PUBLIC
  static var baseUrl = "10.0.2.2";
  static var url = "http://$baseUrl:2008";
  static var mapel = "guru-mapel";
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
  static var urlGetHistoriTinjauanPetugas =
      "$url/petugasBK/absen/histori-tinjauan";
  static var urlGetDetilHistoriTinjauanPetugas = "$url/petugasBK/absen/detail";
  static var urlPatchTinjauAbsenPetugas = "$url/petugasBK/absen/tinjau";
  static String getAbsenByKelasTinjauanPetugas(
      String tanggal, String idKelas, String page) {
    return "$url/petugasBK/absen/byKelas?tanggal=$tanggal&id_kelas=$idKelas&page=$page";
  }

  static String getAbsenSiswaByIdPetugas(String tanggal, String idSiswa) {
    return "$url/petugasBK/absen/bySiswa?tanggal=$tanggal&id_siswa=$idSiswa";
  }

  // GURU MAPEL
  static var urlGetProfileMapel = "$url/guru-mapel/profile";
  static var urlGetKelasDiajarSaatIniMapel =
      "$url/guru-mapel/absen/statistik-kelas-ajar";
  static var urlGetAllKelasDiajarMapel = "$url/guru-mapel/kelas-ajar";
  static var urlGetHistoriKelasDiajarMapel =
      "$url/guru-mapel/absen/histori-kelas-ajar";
  static String getAbsenKelasDiajarMapel(
      String tanggal, String idKelas, String page) {
    return "$url/guru-mapel/absen/histori-absen-kelas?tanggal=$tanggal&id_kelas=$idKelas&page=$page";
  }

  static var urlGetDetilHistoriAbsenMapel = "$url/guru-mapel/absen/detail";

  // SISWA
  static var urlGetProfileSiswa = "$url/siswa/profile";
  static var urlGetRekapAbsenMingguanSiswa = "$url/siswa/absen/rekap-mingguan";
  static var urlGetJadwalAbsenTodaySiswa = "$url/siswa/jadwal/today";
  static var urlGetAvailableAbsenTodaySiswa = "$url/siswa/absen/cekAbsen";
  static var urlGetJadwalHariAbsenSiswa =
      "$url/siswa/jadwal/getHariContainstJadwal";
  static var urlGetDetilLaporanAbsenSiswa = "$url/siswa/absen/detail/";
  static var urlGetDetilJadwalHariAbsenSiswa = "$url/siswa/jadwal?hari=";
  static var urlPostKoordinatAbsenSiswa = "$url/siswa/koordinat-absen/cek";
  static var urlPostAbsenSiswa = "$url/siswa/absen";
  static String getAllHistoriAbsenSiswa(int bulan, int tahun) {
    return "$url/siswa/absen/laporan?month=$bulan&year=$tahun";
  }

  // WALAS
  static var urlGetProfileWalas = "$url/guru-walas/profile";
  static var urlStatistikAbsenWalas = "$url/guru-walas/absen/statistik";
  static var urlGetAbsenKelasWalasByTanggal =
      "$url/guru-walas/absen/kelas?tanggal=";
  static var urlGetAllAbsenSiswaWalas = "$url/guru-walas/absen/laporan?month=";
  static String getAbsenKelasWalas(String tanggal, String page) {
    return "$url/guru-walas/absen/kelas?tanggal=$tanggal&page=$page";
  }
  static var urlGetHistoriAbsenSiswaWalas = "$url/guru-walas/absen/histori";
  static String getAbsenSiswaByIdWalas(String tanggal, String idSiswa) {
    return "$url/guru-walas/absen/siswa?tanggal=$tanggal&id_siswa=$idSiswa";
  }
  static var urlGetDetilHistoriAbsenWalas = "$url/guru-walas/absen/detail";
}
