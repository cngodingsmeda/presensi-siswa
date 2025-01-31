// To parse this JSON data, do
//
//     final detilAbsenSiswaByIdPetugasModel = detilAbsenSiswaByIdPetugasModelFromJson(jsonString);

import 'dart:convert';

DetilAbsenSiswaByIdPetugasModel detilAbsenSiswaByIdPetugasModelFromJson(
        String str) =>
    DetilAbsenSiswaByIdPetugasModel.fromJson(json.decode(str));

String detilAbsenSiswaByIdPetugasModelToJson(
        DetilAbsenSiswaByIdPetugasModel data) =>
    json.encode(data.toJson());

class DetilAbsenSiswaByIdPetugasModel {
  String? msg;
  Data? data;

  DetilAbsenSiswaByIdPetugasModel({
    this.msg,
    this.data,
  });

  factory DetilAbsenSiswaByIdPetugasModel.fromJson(Map<String, dynamic> json) =>
      DetilAbsenSiswaByIdPetugasModel(
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  int? idJadwal;
  int? idSiswa;
  DateTime? tanggal;
  String? jam;
  String? file;
  String? status;
  Siswa? siswa;
  Detail? detail;
  Jadwal? jadwal;

  Data({
    this.id,
    this.idJadwal,
    this.idSiswa,
    this.tanggal,
    this.jam,
    this.file,
    this.status,
    this.siswa,
    this.detail,
    this.jadwal,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        idJadwal: json["id_jadwal"],
        idSiswa: json["id_siswa"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        jam: json["jam"],
        file: json["file"],
        status: json["status"],
        siswa: json["siswa"] == null ? null : Siswa.fromJson(json["siswa"]),
        detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
        jadwal: json["jadwal"] == null ? null : Jadwal.fromJson(json["jadwal"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_jadwal": idJadwal,
        "id_siswa": idSiswa,
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "jam": jam,
        "file": file,
        "status": status,
        "siswa": siswa?.toJson(),
        "detail": detail?.toJson(),
        "jadwal": jadwal?.toJson(),
      };
}

class Detail {
  int? id;
  int? idAbsen;
  String? catatan;
  String? statusTinjauan;
  dynamic idPeninjau;
  dynamic tanggalTinjauan;
  dynamic petugasBk;

  Detail({
    this.id,
    this.idAbsen,
    this.catatan,
    this.statusTinjauan,
    this.idPeninjau,
    this.tanggalTinjauan,
    this.petugasBk,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        idAbsen: json["id_absen"],
        catatan: json["catatan"],
        statusTinjauan: json["status_tinjauan"],
        idPeninjau: json["id_peninjau"],
        tanggalTinjauan: json["tanggal_tinjauan"],
        petugasBk: json["petugas_bk"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_absen": idAbsen,
        "catatan": catatan,
        "status_tinjauan": statusTinjauan,
        "id_peninjau": idPeninjau,
        "tanggal_tinjauan": tanggalTinjauan,
        "petugas_bk": petugasBk,
      };
}

class Jadwal {
  int? id;
  String? hari;
  String? jamMulai;
  String? jamSelesai;
  Koordinat? koordinat;

  Jadwal({
    this.id,
    this.hari,
    this.jamMulai,
    this.jamSelesai,
    this.koordinat,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        id: json["id"],
        hari: json["hari"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
        koordinat: json["koordinat"] == null
            ? null
            : Koordinat.fromJson(json["koordinat"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hari": hari,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
        "koordinat": koordinat?.toJson(),
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

class Siswa {
  int? id;
  String? nis;
  String? nama;
  String? jenisKelamin;
  String? email;
  String? noTelepon;
  dynamic tokenFcm;
  dynamic fotoProfile;

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
        id: json["id"],
        nis: json["nis"],
        nama: json["nama"],
        jenisKelamin: json["jenis_kelamin"],
        email: json["email"],
        noTelepon: json["no_telepon"],
        tokenFcm: json["token_FCM"],
        fotoProfile: json["foto_profile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nis": nis,
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
        "email": email,
        "no_telepon": noTelepon,
        "token_FCM": tokenFcm,
        "foto_profile": fotoProfile,
      };
}
