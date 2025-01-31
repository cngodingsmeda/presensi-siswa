// To parse this JSON data, do
//
//     final historiTinjauanAbsenPetugasModel = historiTinjauanAbsenPetugasModelFromJson(jsonString);

import 'dart:convert';

HistoriTinjauanAbsenPetugasModel historiTinjauanAbsenPetugasModelFromJson(String str) => HistoriTinjauanAbsenPetugasModel.fromJson(json.decode(str));

String historiTinjauanAbsenPetugasModelToJson(HistoriTinjauanAbsenPetugasModel data) => json.encode(data.toJson());

class HistoriTinjauanAbsenPetugasModel {
    String? msg;
    Data? data;

    HistoriTinjauanAbsenPetugasModel({
        this.msg,
        this.data,
    });

    factory HistoriTinjauanAbsenPetugasModel.fromJson(Map<String, dynamic> json) => HistoriTinjauanAbsenPetugasModel(
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
    };
}

class Data {
    List<BelumDitinjau>? belumDitinjau;
    List<BelumDitinjau>? diterima;
    List<BelumDitinjau>? ditolak;

    Data({
        this.belumDitinjau,
        this.diterima,
        this.ditolak,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        belumDitinjau: json["belum_ditinjau"] == null ? [] : List<BelumDitinjau>.from(json["belum_ditinjau"]!.map((x) => BelumDitinjau.fromJson(x))),
        diterima: json["diterima"] == null ? [] : List<BelumDitinjau>.from(json["diterima"]!.map((x) => BelumDitinjau.fromJson(x))),
        ditolak: json["ditolak"] == null ? [] : List<BelumDitinjau>.from(json["ditolak"]!.map((x) => BelumDitinjau.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "belum_ditinjau": belumDitinjau == null ? [] : List<dynamic>.from(belumDitinjau!.map((x) => x.toJson())),
        "diterima": diterima == null ? [] : List<dynamic>.from(diterima!.map((x) => x.toJson())),
        "ditolak": ditolak == null ? [] : List<dynamic>.from(ditolak!.map((x) => x.toJson())),
    };
}

class BelumDitinjau {
    int? id;
    int? idJadwal;
    int? idSiswa;
    DateTime? tanggal;
    String? jam;
    String? file;
    String? status;
    Siswa? siswa;

    BelumDitinjau({
        this.id,
        this.idJadwal,
        this.idSiswa,
        this.tanggal,
        this.jam,
        this.file,
        this.status,
        this.siswa,
    });

    factory BelumDitinjau.fromJson(Map<String, dynamic> json) => BelumDitinjau(
        id: json["id"],
        idJadwal: json["id_jadwal"],
        idSiswa: json["id_siswa"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        jam: json["jam"],
        file: json["file"],
        status: json["status"],
        siswa: json["siswa"] == null ? null : Siswa.fromJson(json["siswa"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_jadwal": idJadwal,
        "id_siswa": idSiswa,
        "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "jam": jam,
        "file": file,
        "status": status,
        "siswa": siswa?.toJson(),
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
    Kelas? kelas;

    Siswa({
        this.id,
        this.nis,
        this.nama,
        this.jenisKelamin,
        this.email,
        this.noTelepon,
        this.tokenFcm,
        this.fotoProfile,
        this.kelas,
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
        kelas: json["kelas"] == null ? null : Kelas.fromJson(json["kelas"]),
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
        "kelas": kelas?.toJson(),
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
