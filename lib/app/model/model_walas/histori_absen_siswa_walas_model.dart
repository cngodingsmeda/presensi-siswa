// To parse this JSON data, do
//
//     final historiAbsenSiswaWalasModel = historiAbsenSiswaWalasModelFromJson(jsonString);

import 'dart:convert';

HistoriAbsenSiswaWalasModel historiAbsenSiswaWalasModelFromJson(String str) => HistoriAbsenSiswaWalasModel.fromJson(json.decode(str));

String historiAbsenSiswaWalasModelToJson(HistoriAbsenSiswaWalasModel data) => json.encode(data.toJson());

class HistoriAbsenSiswaWalasModel {
    String? msg;
    List<Datum>? data;

    HistoriAbsenSiswaWalasModel({
        this.msg,
        this.data,
    });

    factory HistoriAbsenSiswaWalasModel.fromJson(Map<String, dynamic> json) => HistoriAbsenSiswaWalasModel(
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

    Datum({
        this.id,
        this.idJadwal,
        this.idSiswa,
        this.tanggal,
        this.jam,
        this.file,
        this.status,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
