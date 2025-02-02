// To parse this JSON data, do
//
//     final profileWalasModel = profileWalasModelFromJson(jsonString);

import 'dart:convert';

ProfileWalasModel profileWalasModelFromJson(String str) => ProfileWalasModel.fromJson(json.decode(str));

String profileWalasModelToJson(ProfileWalasModel data) => json.encode(data.toJson());

class ProfileWalasModel {
    String? msg;
    Data? data;

    ProfileWalasModel({
        this.msg,
        this.data,
    });

    factory ProfileWalasModel.fromJson(Map<String, dynamic> json) => ProfileWalasModel(
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
    dynamic fotoProfile;
    int? idSekolah;
    int? idTahun;
    int? idKelas;
    dynamic tokenFcm;
    Alamat? alamat;
    Kelas? kelas;
    Sekolah? sekolah;

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
        this.idKelas,
        this.tokenFcm,
        this.alamat,
        this.kelas,
        this.sekolah,
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
        idKelas: json["id_kelas"],
        tokenFcm: json["token_FCM"],
        alamat: json["alamat"] == null ? null : Alamat.fromJson(json["alamat"]),
        kelas: json["kelas"] == null ? null : Kelas.fromJson(json["kelas"]),
        sekolah: json["sekolah"] == null ? null : Sekolah.fromJson(json["sekolah"]),
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
        "alamat": alamat?.toJson(),
        "kelas": kelas?.toJson(),
        "sekolah": sekolah?.toJson(),
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

class Sekolah {
    int? id;
    String? npsn;
    String? nama;
    dynamic logo;

    Sekolah({
        this.id,
        this.npsn,
        this.nama,
        this.logo,
    });

    factory Sekolah.fromJson(Map<String, dynamic> json) => Sekolah(
        id: json["id"],
        npsn: json["npsn"],
        nama: json["nama"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "npsn": npsn,
        "nama": nama,
        "logo": logo,
    };
}
