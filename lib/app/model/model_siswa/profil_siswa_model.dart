// To parse this JSON data, do
//
//     final profileSiswaModel = profileSiswaModelFromJson(jsonString);

import 'dart:convert';

ProfileSiswaModel profileSiswaModelFromJson(String str) => ProfileSiswaModel.fromJson(json.decode(str));

String profileSiswaModelToJson(ProfileSiswaModel data) => json.encode(data.toJson());

class ProfileSiswaModel {
    String? msg;
    Data? data;

    ProfileSiswaModel({
        this.msg,
        this.data,
    });

    factory ProfileSiswaModel.fromJson(Map<String, dynamic> json) => ProfileSiswaModel(
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
    String? nis;
    String? nama;
    String? jenisKelamin;
    String? email;
    String? noTelepon;
    String? tokenFcm;
    String? fotoProfile;
    Jurusan? jurusan;
    Alamat? alamat;
    Kelas? kelas;

    Data({
        this.id,
        this.nis,
        this.nama,
        this.jenisKelamin,
        this.email,
        this.noTelepon,
        this.tokenFcm,
        this.fotoProfile,
        this.jurusan,
        this.alamat,
        this.kelas,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nis: json["nis"],
        nama: json["nama"],
        jenisKelamin: json["jenis_kelamin"],
        email: json["email"],
        noTelepon: json["no_telepon"],
        tokenFcm: json["token_FCM"],
        fotoProfile: json["foto_profile"],
        jurusan: json["jurusan"] == null ? null : Jurusan.fromJson(json["jurusan"]),
        alamat: json["alamat"] == null ? null : Alamat.fromJson(json["alamat"]),
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
        "jurusan": jurusan?.toJson(),
        "alamat": alamat?.toJson(),
        "kelas": kelas?.toJson(),
    };
}

class Alamat {
    String? detailTempat;
    String? desa;
    String? kecamatan;
    String? kabupaten;
    String? provinsi;
    String? negara;

    Alamat({
        this.detailTempat,
        this.desa,
        this.kecamatan,
        this.kabupaten,
        this.provinsi,
        this.negara,
    });

    factory Alamat.fromJson(Map<String, dynamic> json) => Alamat(
        detailTempat: json["detail_tempat"],
        desa: json["desa"],
        kecamatan: json["kecamatan"],
        kabupaten: json["kabupaten"],
        provinsi: json["provinsi"],
        negara: json["negara"],
    );

    Map<String, dynamic> toJson() => {
        "detail_tempat": detailTempat,
        "desa": desa,
        "kecamatan": kecamatan,
        "kabupaten": kabupaten,
        "provinsi": provinsi,
        "negara": negara,
    };
}

class Jurusan {
    int? id;
    String? nama;
    int? idSekolah;
    int? idTahun;

    Jurusan({
        this.id,
        this.nama,
        this.idSekolah,
        this.idTahun,
    });

    factory Jurusan.fromJson(Map<String, dynamic> json) => Jurusan(
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
