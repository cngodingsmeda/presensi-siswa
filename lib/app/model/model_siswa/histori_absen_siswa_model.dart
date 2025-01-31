// To parse this JSON data, do
//
//     final historiAbsenSiswaModel = historiAbsenSiswaModelFromJson(jsonString);

import 'dart:convert';

HistoriAbsenSiswaModel historiAbsenSiswaModelFromJson(String str) => HistoriAbsenSiswaModel.fromJson(json.decode(str));

String historiAbsenSiswaModelToJson(HistoriAbsenSiswaModel data) => json.encode(data.toJson());

class HistoriAbsenSiswaModel {
    String? msg;
    Data? data;

    HistoriAbsenSiswaModel({
        this.msg,
        this.data,
    });

    factory HistoriAbsenSiswaModel.fromJson(Map<String, dynamic> json) => HistoriAbsenSiswaModel(
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
    };
}

class Data {
    List<WaktuAbsen>? waktuAbsen;

    Data({
        this.waktuAbsen,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        waktuAbsen: json["waktuAbsen"] == null ? [] : List<WaktuAbsen>.from(json["waktuAbsen"]!.map((x) => WaktuAbsen.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "waktuAbsen": waktuAbsen == null ? [] : List<dynamic>.from(waktuAbsen!.map((x) => x.toJson())),
    };
}

class WaktuAbsen {
    Absen? absen;
    Mapel? mapel;

    WaktuAbsen({
        this.absen,
        this.mapel,
    });

    factory WaktuAbsen.fromJson(Map<String, dynamic> json) => WaktuAbsen(
        absen: json["absen"] == null ? null : Absen.fromJson(json["absen"]),
        mapel: json["mapel"] == null ? null : Mapel.fromJson(json["mapel"]),
    );

    Map<String, dynamic> toJson() => {
        "absen": absen?.toJson(),
        "mapel": mapel?.toJson(),
    };
}

class Absen {
    int? id;
    int? idJadwal;
    int? idSiswa;
    DateTime? tanggal;
    String? jam;
    String? file;
    String? status;

    Absen({
        this.id,
        this.idJadwal,
        this.idSiswa,
        this.tanggal,
        this.jam,
        this.file,
        this.status,
    });

    factory Absen.fromJson(Map<String, dynamic> json) => Absen(
        id: json["id"],
        idJadwal: json["id_jadwal"],
        idSiswa: json["id_siswa"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        jam: json["jam"],
        file: json["file"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_jadwal": idJadwal,
        "id_siswa": idSiswa,
        "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "jam": jam,
        "file": file,
        "status": status,
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
