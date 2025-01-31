// To parse this JSON data, do
//
//     final detilJadwalAbsenSiswaModel = detilJadwalAbsenSiswaModelFromJson(jsonString);

import 'dart:convert';

DetilJadwalAbsenSiswaModel detilJadwalAbsenSiswaModelFromJson(String str) =>
    DetilJadwalAbsenSiswaModel.fromJson(json.decode(str));

String detilJadwalAbsenSiswaModelToJson(DetilJadwalAbsenSiswaModel data) =>
    json.encode(data.toJson());

class DetilJadwalAbsenSiswaModel {
  String? msg;
  List<Datum>? data;

  DetilJadwalAbsenSiswaModel({
    this.msg,
    this.data,
  });

  factory DetilJadwalAbsenSiswaModel.fromJson(Map<String, dynamic> json) =>
      DetilJadwalAbsenSiswaModel(
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? hari;
  String? jamMulai;
  String? jamSelesai;
  Mapel? mapel;
  Kelas? kelas;
  GuruMapel? guruMapel;
  Koordinat? koordinat;

  Datum({
    this.id,
    this.hari,
    this.jamMulai,
    this.jamSelesai,
    this.mapel,
    this.kelas,
    this.guruMapel,
    this.koordinat,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        hari: json["hari"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
        mapel: json["mapel"] == null ? null : Mapel.fromJson(json["mapel"]),
        kelas: json["kelas"] == null ? null : Kelas.fromJson(json["kelas"]),
        guruMapel: json["guru_mapel"] == null
            ? null
            : GuruMapel.fromJson(json["guru_mapel"]),
        koordinat: json["koordinat"] == null
            ? null
            : Koordinat.fromJson(json["koordinat"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hari": hari,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
        "mapel": mapel?.toJson(),
        "kelas": kelas?.toJson(),
        "guru_mapel": guruMapel?.toJson(),
        "koordinat": koordinat?.toJson(),
      };
}

class GuruMapel {
  int? id;
  String? nip;
  String? nama;
  String? noTelepon;
  String? email;
  String? jenisKelamin;
  String? tempatLahir;
  DateTime? tanggalLahir;
  String? agama;
  dynamic fotoProfile;
  int? idSekolah;
  int? idTahun;
  int? idMapel;
  dynamic tokenFcm;

  GuruMapel({
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
    this.idMapel,
    this.tokenFcm,
  });

  factory GuruMapel.fromJson(Map<String, dynamic> json) => GuruMapel(
        id: json["id"],
        nip: json["nip"],
        nama: json["nama"],
        noTelepon: json["no_telepon"],
        email: json["email"],
        jenisKelamin: json["jenis_kelamin"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"] == null
            ? null
            : DateTime.parse(json["tanggal_lahir"]),
        agama: json["agama"],
        fotoProfile: json["foto_profile"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
        idMapel: json["id_mapel"],
        tokenFcm: json["token_FCM"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "nama": nama,
        "no_telepon": noTelepon,
        "email": email,
        "jenis_kelamin": jenisKelamin,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir":
            "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "agama": agama,
        "foto_profile": fotoProfile,
        "id_sekolah": idSekolah,
        "id_tahun": idTahun,
        "id_mapel": idMapel,
        "token_FCM": tokenFcm,
      };
}

class Kelas {
  int? id;
  String? nama;
  int? idJurusan;

  Kelas({
    this.id,
    this.nama,
    this.idJurusan,
  });

  factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        id: json["id"],
        nama: json["nama"],
        idJurusan: json["id_jurusan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "id_jurusan": idJurusan,
      };
}

class Koordinat {
  int? id;
  int? idKelas;
  String? namaTempat;
  double? latitude;
  double? longitude;
  double? radiusAbsenMeter;

  Koordinat({
    this.id,
    this.idKelas,
    this.namaTempat,
    this.latitude,
    this.longitude,
    this.radiusAbsenMeter,
  });

  factory Koordinat.fromJson(Map<String, dynamic> json) => Koordinat(
        id: json["id"],
        idKelas: json["id_kelas"],
        namaTempat: json["nama_tempat"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        radiusAbsenMeter: json["radius_absen_meter"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_kelas": idKelas,
        "nama_tempat": namaTempat,
        "latitude": latitude,
        "longitude": longitude,
        "radius_absen_meter": radiusAbsenMeter,
      };
}

class Mapel {
  int? id;
  String? nama;
  int? idSekolah;
  int? idTahun;

  Mapel({
    this.id,
    this.nama,
    this.idSekolah,
    this.idTahun,
  });

  factory Mapel.fromJson(Map<String, dynamic> json) => Mapel(
        id: json["id"],
        nama: json["nama"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "id_sekolah": idSekolah,
        "id_tahun": idTahun,
      };
}
