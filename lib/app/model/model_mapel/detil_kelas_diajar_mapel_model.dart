import 'dart:convert';

DetilKelasDiajarMapelModel detilKelasDiajarMapelModelFromJson(String str) =>
    DetilKelasDiajarMapelModel.fromJson(json.decode(str));

String detilKelasDiajarMapelModelToJson(DetilKelasDiajarMapelModel data) =>
    json.encode(data.toJson());

class DetilKelasDiajarMapelModel {
  String? msg;
  Data? data;

  DetilKelasDiajarMapelModel({this.msg, this.data});

  factory DetilKelasDiajarMapelModel.fromJson(Map<String, dynamic> json) {
    return DetilKelasDiajarMapelModel(
      msg: json['msg'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'data': data?.toJson(),
      };
}

class Data {
  int? countData;
  int? countPage;
  List<AbsenElement>? absen;
  int? jumlahSiswa;
  GuruWalas? guruWalas;

  Data({
    this.countData,
    this.countPage,
    this.absen,
    this.jumlahSiswa,
    this.guruWalas,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      countData: json['count_data'],
      countPage: json['count_page'],
      jumlahSiswa: json['jumlah_siswa'],
      absen: json['absen'] == null
          ? []
          : List<AbsenElement>.from(
              json['absen'].map((x) => AbsenElement.fromJson(x))),
      guruWalas: json['guru_walas'] != null
          ? GuruWalas.fromJson(json['guru_walas'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'count_data': countData,
        'count_page': countPage,
        'jumlah_siswa': jumlahSiswa,
        'absen': absen?.map((x) => x.toJson()).toList(),
        'guru_walas': guruWalas?.toJson(),
      };
}

class AbsenElement {
  Siswa? siswa;
  AbsenAbsen? absen;

  AbsenElement({this.siswa, this.absen});

  factory AbsenElement.fromJson(Map<String, dynamic> json) => AbsenElement(
        siswa: json['siswa'] != null ? Siswa.fromJson(json['siswa']) : null,
        absen: json['absen'] != null ? AbsenAbsen.fromJson(json['absen']) : null,
      );

  Map<String, dynamic> toJson() => {
        'siswa': siswa?.toJson(),
        'absen': absen?.toJson(),
      };
}

class AbsenAbsen {
  int? id;
  int? idJadwal;
  int? idSiswa;
  DateTime? tanggal;
  String? jam;
  String? file;
  String? status;

  AbsenAbsen({
    this.id,
    this.idJadwal,
    this.idSiswa,
    this.tanggal,
    this.jam,
    this.file,
    this.status,
  });

  factory AbsenAbsen.fromJson(Map<String, dynamic> json) => AbsenAbsen(
        id: json['id'],
        idJadwal: json['id_jadwal'],
        idSiswa: json['id_siswa'],
        tanggal: json['tanggal'] == null
            ? null
            : DateTime.parse(json['tanggal']),
        jam: json['jam'],
        file: json['file'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_jadwal': idJadwal,
        'id_siswa': idSiswa,
        'tanggal': tanggal?.toIso8601String(),
        'jam': jam,
        'file': file,
        'status': status,
      };
}

class Siswa {
  int? id;
  String? nis;
  String? nama;
  String? jenisKelamin;
  String? email;
  String? noTelepon;
  String? tokenFcm;
  String? fotoProfile;

  Siswa({
    this.id,
    this.nis,
    this.nama,
    this.jenisKelamin,
    this.email,
    this.noTelepon,
    this.tokenFcm,
    this.fotoProfile,
  });

  factory Siswa.fromJson(Map<String, dynamic> json) => Siswa(
        id: json['id'],
        nis: json['nis'],
        nama: json['nama'],
        jenisKelamin: json['jenis_kelamin'],
        email: json['email'],
        noTelepon: json['no_telepon'],
        tokenFcm: json['token_FCM'],
        fotoProfile: json['foto_profile'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nis': nis,
        'nama': nama,
        'jenis_kelamin': jenisKelamin,
        'email': email,
        'no_telepon': noTelepon,
        'token_FCM': tokenFcm,
        'foto_profile': fotoProfile,
      };
}

class GuruWalas {
  int? id;
  String? nip;
  String? nama;
  String? noTelepon;
  String? email;
  String? jenisKelamin;
  String? tempatLahir;
  DateTime? tanggalLahir;
  String? agama;
  String? fotoProfile;
  int? idSekolah;
  int? idTahun;
  int? idKelas;
  String? tokenFcm;

  GuruWalas({
    this.id,
    this.nip,
    this.nama,
    this.noTelepon,
    this.email,
    this.jenisKelamin,
    this.tempatLahir,
    this.tanggalLahir,
    this.agama,
    this.fotoProfile,
    this.idSekolah,
    this.idTahun,
    this.idKelas,
    this.tokenFcm,
  });

  factory GuruWalas.fromJson(Map<String, dynamic> json) => GuruWalas(
        id: json['id'],
        nip: json['nip'],
        nama: json['nama'],
        noTelepon: json['no_telepon'],
        email: json['email'],
        jenisKelamin: json['jenis_kelamin'],
        tempatLahir: json['tempat_lahir'],
        tanggalLahir: json['tanggal_lahir'] == null
            ? null
            : DateTime.parse(json['tanggal_lahir']),
        agama: json['agama'],
        fotoProfile: json['foto_profile'],
        idSekolah: json['id_sekolah'],
        idTahun: json['id_tahun'],
        idKelas: json['id_kelas'],
        tokenFcm: json['token_FCM'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nip': nip,
        'nama': nama,
        'no_telepon': noTelepon,
        'email': email,
        'jenis_kelamin': jenisKelamin,
        'tempat_lahir': tempatLahir,
        'tanggal_lahir': tanggalLahir?.toIso8601String(),
        'agama': agama,
        'foto_profile': fotoProfile,
        'id_sekolah': idSekolah,
        'id_tahun': idTahun,
        'id_kelas': idKelas,
        'token_FCM': tokenFcm,
      };
}
