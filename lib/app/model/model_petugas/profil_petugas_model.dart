// To parse this JSON data, do
//
//     final profilePetugasModel = profilePetugasModelFromJson(jsonString);

import 'dart:convert';

ProfilePetugasModel profilePetugasModelFromJson(String str) => ProfilePetugasModel.fromJson(json.decode(str));

String profilePetugasModelToJson(ProfilePetugasModel data) => json.encode(data.toJson());

class ProfilePetugasModel {
    String? msg;
    Data? data;

    ProfilePetugasModel({
        this.msg,
        this.data,
    });

    factory ProfilePetugasModel.fromJson(Map<String, dynamic> json) => ProfilePetugasModel(
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
    String? tokenFcm;
    Alamat? alamat;
    List<DistribusiPetugasBk>? distribusiPetugasBk;

    Data({
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
        this.tokenFcm,
        this.alamat,
        this.distribusiPetugasBk,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        tokenFcm: json["token_FCM"],
        alamat: json["alamat"] == null ? null : Alamat.fromJson(json["alamat"]),
        distribusiPetugasBk: json["distribusi_petugas_BK"] == null ? [] : List<DistribusiPetugasBk>.from(json["distribusi_petugas_BK"]!.map((x) => DistribusiPetugasBk.fromJson(x))),
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
        "token_FCM": tokenFcm,
        "alamat": alamat?.toJson(),
        "distribusi_petugas_BK": distribusiPetugasBk == null ? [] : List<dynamic>.from(distribusiPetugasBk!.map((x) => x.toJson())),
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

class DistribusiPetugasBk {
    int? id;
    Kelas? kelas;

    DistribusiPetugasBk({
        this.id,
        this.kelas,
    });

    factory DistribusiPetugasBk.fromJson(Map<String, dynamic> json) => DistribusiPetugasBk(
        id: json["id"],
        kelas: json["kelas"] == null ? null : Kelas.fromJson(json["kelas"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
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
