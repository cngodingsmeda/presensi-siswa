// To parse this JSON data, do
//
//     final jadwalAbsenTodaySiswaModel = jadwalAbsenTodaySiswaModelFromJson(jsonString);

import 'dart:convert';

JadwalAbsenTodaySiswaModel jadwalAbsenTodaySiswaModelFromJson(String str) => JadwalAbsenTodaySiswaModel.fromJson(json.decode(str));

String jadwalAbsenTodaySiswaModelToJson(JadwalAbsenTodaySiswaModel data) => json.encode(data.toJson());

class JadwalAbsenTodaySiswaModel {
    String? msg;
    Data? data;

    JadwalAbsenTodaySiswaModel({
        this.msg,
        this.data,
    });

    factory JadwalAbsenTodaySiswaModel.fromJson(Map<String, dynamic> json) => JadwalAbsenTodaySiswaModel(
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
    };
}

class Data {
    List<DataJadwal>? dataJadwal;
    int? countMapel;

    Data({
        this.dataJadwal,
        this.countMapel,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataJadwal: json["dataJadwal"] == null ? [] : List<DataJadwal>.from(json["dataJadwal"]!.map((x) => DataJadwal.fromJson(x))),
        countMapel: json["countMapel"],
    );

    Map<String, dynamic> toJson() => {
        "dataJadwal": dataJadwal == null ? [] : List<dynamic>.from(dataJadwal!.map((x) => x.toJson())),
        "countMapel": countMapel,
    };
}

class DataJadwal {
    Jadwal? jadwal;
    bool? isAbsen;

    DataJadwal({
        this.jadwal,
        this.isAbsen,
    });

    factory DataJadwal.fromJson(Map<String, dynamic> json) => DataJadwal(
        jadwal: json["jadwal"] == null ? null : Jadwal.fromJson(json["jadwal"]),
        isAbsen: json["isAbsen"],
    );

    Map<String, dynamic> toJson() => {
        "jadwal": jadwal?.toJson(),
        "isAbsen": isAbsen,
    };
}

class Jadwal {
    int? id;
    String? hari;
    String? jamMulai;
    String? jamSelesai;
    Mapel? mapel;

    Jadwal({
        this.id,
        this.hari,
        this.jamMulai,
        this.jamSelesai,
        this.mapel,
    });

    factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        id: json["id"],
        hari: json["hari"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
        mapel: json["mapel"] == null ? null : Mapel.fromJson(json["mapel"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hari": hari,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
        "mapel": mapel?.toJson(),
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
