// To parse this JSON data, do
//
//     final profileMapelModel = profileMapelModelFromJson(jsonString);

import 'dart:convert';

ProfileMapelModel profileMapelModelFromJson(String str) => ProfileMapelModel.fromJson(json.decode(str));

String profileMapelModelToJson(ProfileMapelModel data) => json.encode(data.toJson());

class ProfileMapelModel {
    String? msg;
    Data? data;

    ProfileMapelModel({
        this.msg,
        this.data,
    });

    factory ProfileMapelModel.fromJson(Map<String, dynamic> json) => ProfileMapelModel(
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
    int? idMapel;
    dynamic tokenFcm;
    Alamat? alamat;
    Mapel? mapel;
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
        this.idMapel,
        this.tokenFcm,
        this.alamat,
        this.mapel,
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
        idMapel: json["id_mapel"],
        tokenFcm: json["token_FCM"],
        alamat: json["alamat"] == null ? null : Alamat.fromJson(json["alamat"]),
        mapel: json["mapel"] == null ? null : Mapel.fromJson(json["mapel"]),
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
        "id_mapel": idMapel,
        "token_FCM": tokenFcm,
        "alamat": alamat?.toJson(),
        "mapel": mapel?.toJson(),
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
