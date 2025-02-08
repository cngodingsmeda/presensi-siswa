// To parse this JSON data, do
//
//     final allHistoriKelasDiajarMapelModel = allHistoriKelasDiajarMapelModelFromJson(jsonString);

import 'dart:convert';

AllHistoriKelasDiajarMapelModel allHistoriKelasDiajarMapelModelFromJson(String str) => AllHistoriKelasDiajarMapelModel.fromJson(json.decode(str));

String allHistoriKelasDiajarMapelModelToJson(AllHistoriKelasDiajarMapelModel data) => json.encode(data.toJson());

class AllHistoriKelasDiajarMapelModel {
    String? msg;
    List<Datum>? data;

    AllHistoriKelasDiajarMapelModel({
        this.msg,
        this.data,
    });

    factory AllHistoriKelasDiajarMapelModel.fromJson(Map<String, dynamic> json) => AllHistoriKelasDiajarMapelModel(
        msg: json["msg"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Kelas? kelas;
    int? jumlahHadir;
    DateTime? tanggal;

    Datum({
        this.kelas,
        this.jumlahHadir,
        this.tanggal,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        kelas: json["kelas"] == null ? null : Kelas.fromJson(json["kelas"]),
        jumlahHadir: json["jumlah_hadir"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
    );

    Map<String, dynamic> toJson() => {
        "kelas": kelas?.toJson(),
        "jumlah_hadir": jumlahHadir,
        "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
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
