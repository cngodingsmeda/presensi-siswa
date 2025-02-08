// To parse this JSON data, do
//
//     final kelasDiajarSaatIniMapelModel = kelasDiajarSaatIniMapelModelFromJson(jsonString);

import 'dart:convert';

KelasDiajarSaatIniMapelModel kelasDiajarSaatIniMapelModelFromJson(String str) => KelasDiajarSaatIniMapelModel.fromJson(json.decode(str));

String kelasDiajarSaatIniMapelModelToJson(KelasDiajarSaatIniMapelModel data) => json.encode(data.toJson());

class KelasDiajarSaatIniMapelModel {
    String? msg;
    Data? data;

    KelasDiajarSaatIniMapelModel({
        this.msg,
        this.data,
    });

    factory KelasDiajarSaatIniMapelModel.fromJson(Map<String, dynamic> json) => KelasDiajarSaatIniMapelModel(
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
    };
}

class Data {
    int? jumlahSiswa;
    Kelas? kelas;

    Data({
        this.jumlahSiswa,
        this.kelas,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        jumlahSiswa: json["jumlah_siswa"],
        kelas: json["kelas"] == null ? null : Kelas.fromJson(json["kelas"]),
    );

    Map<String, dynamic> toJson() => {
        "jumlah_siswa": jumlahSiswa,
        "kelas": kelas?.toJson(),
    };
}

class Kelas {
    int? id;
    String? nama;
    int? idJurusan;
    GuruWalas? guruWalas;

    Kelas({
        this.id,
        this.nama,
        this.idJurusan,
        this.guruWalas,
    });

    factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        id: json["id"],
        nama: json["nama"],
        idJurusan: json["id_jurusan"],
        guruWalas: json["guru_walas"] == null ? null : GuruWalas.fromJson(json["guru_walas"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "id_jurusan": idJurusan,
        "guru_walas": guruWalas?.toJson(),
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
    dynamic fotoProfile;
    int? idSekolah;
    int? idTahun;
    int? idKelas;
    dynamic tokenFcm;

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
        id: json["id"],
        nip: json["nip"],
        nama: json["nama"],
        noTelepon: json["no_telepon"],
        email: json["email"],
        jenisKelamin: json["jenis_kelamin"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"] == null ? null : DateTime.parse(json["tanggal_lahir"]),
        agama: json["agama"],
        fotoProfile: json["foto_profile"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
        idKelas: json["id_kelas"],
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
        "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "agama": agama,
        "foto_profile": fotoProfile,
        "id_sekolah": idSekolah,
        "id_tahun": idTahun,
        "id_kelas": idKelas,
        "token_FCM": tokenFcm,
    };
}
