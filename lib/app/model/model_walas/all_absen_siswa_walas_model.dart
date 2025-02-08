// To parse this JSON data, do
//
//     final allLaporanSiswaWalasModel = allLaporanSiswaWalasModelFromJson(jsonString);

import 'dart:convert';

AllLaporanSiswaWalasModel allLaporanSiswaWalasModelFromJson(String str) => AllLaporanSiswaWalasModel.fromJson(json.decode(str));

String allLaporanSiswaWalasModelToJson(AllLaporanSiswaWalasModel data) => json.encode(data.toJson());

class AllLaporanSiswaWalasModel {
    String? msg;
    Data? data;

    AllLaporanSiswaWalasModel({
        this.msg,
        this.data,
    });

    factory AllLaporanSiswaWalasModel.fromJson(Map<String, dynamic> json) => AllLaporanSiswaWalasModel(
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
    };
}

class Data {
    List<The20250203>? the20250203;

    Data({
        this.the20250203,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        the20250203: json["2025-02-03"] == null ? [] : List<The20250203>.from(json["2025-02-03"]!.map((x) => The20250203.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "2025-02-03": the20250203 == null ? [] : List<dynamic>.from(the20250203!.map((x) => x.toJson())),
    };
}

class The20250203 {
    Absen? absen;
    Mapel? mapel;

    The20250203({
        this.absen,
        this.mapel,
    });

    factory The20250203.fromJson(Map<String, dynamic> json) => The20250203(
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
