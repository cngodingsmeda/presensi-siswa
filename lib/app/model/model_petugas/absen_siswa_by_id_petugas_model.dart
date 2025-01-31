// To parse this JSON data, do
//
//     final absenSiswaByIdPetugasModel = absenSiswaByIdPetugasModelFromJson(jsonString);

import 'dart:convert';

AbsenSiswaByIdPetugasModel absenSiswaByIdPetugasModelFromJson(String str) => AbsenSiswaByIdPetugasModel.fromJson(json.decode(str));

String absenSiswaByIdPetugasModelToJson(AbsenSiswaByIdPetugasModel data) => json.encode(data.toJson());

class AbsenSiswaByIdPetugasModel {
    String? msg;
    List<Datum>? data;

    AbsenSiswaByIdPetugasModel({
        this.msg,
        this.data,
    });

    factory AbsenSiswaByIdPetugasModel.fromJson(Map<String, dynamic> json) => AbsenSiswaByIdPetugasModel(
        msg: json["msg"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    int? idJadwal;
    int? idSiswa;
    DateTime? tanggal;
    String? jam;
    String? file;
    String? status;
    Jadwal? jadwal;

    Datum({
        this.id,
        this.idJadwal,
        this.idSiswa,
        this.tanggal,
        this.jam,
        this.file,
        this.status,
        this.jadwal,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idJadwal: json["id_jadwal"],
        idSiswa: json["id_siswa"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        jam: json["jam"],
        file: json["file"],
        status: json["status"],
        jadwal: json["jadwal"] == null ? null : Jadwal.fromJson(json["jadwal"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_jadwal": idJadwal,
        "id_siswa": idSiswa,
        "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "jam": jam,
        "file": file,
        "status": status,
        "jadwal": jadwal?.toJson(),
    };
}

class Jadwal {
    int? id;
    String? hari;
    String? jamMulai;
    String? jamSelesai;
    Mapel? mapel;
    GuruMapel? guruMapel;

    Jadwal({
        this.id,
        this.hari,
        this.jamMulai,
        this.jamSelesai,
        this.mapel,
        this.guruMapel,
    });

    factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        id: json["id"],
        hari: json["hari"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
        mapel: json["mapel"] == null ? null : Mapel.fromJson(json["mapel"]),
        guruMapel: json["guru_mapel"] == null ? null : GuruMapel.fromJson(json["guru_mapel"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hari": hari,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
        "mapel": mapel?.toJson(),
        "guru_mapel": guruMapel?.toJson(),
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
        tanggalLahir: json["tanggal_lahir"] == null ? null : DateTime.parse(json["tanggal_lahir"]),
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
        "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "agama": agama,
        "foto_profile": fotoProfile,
        "id_sekolah": idSekolah,
        "id_tahun": idTahun,
        "id_mapel": idMapel,
        "token_FCM": tokenFcm,
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
