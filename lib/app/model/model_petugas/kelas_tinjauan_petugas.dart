// To parse this JSON data, do
//
//     final kelasTinjauanPetugasModel = kelasTinjauanPetugasModelFromJson(jsonString);

import 'dart:convert';

KelasTinjauanPetugasModel kelasTinjauanPetugasModelFromJson(String str) => KelasTinjauanPetugasModel.fromJson(json.decode(str));

String kelasTinjauanPetugasModelToJson(KelasTinjauanPetugasModel data) => json.encode(data.toJson());

class KelasTinjauanPetugasModel {
    String? msg;
    List<Datum>? data;

    KelasTinjauanPetugasModel({
        this.msg,
        this.data,
    });

    factory KelasTinjauanPetugasModel.fromJson(Map<String, dynamic> json) => KelasTinjauanPetugasModel(
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
    String? nama;
    int? idJurusan;

    Datum({
        this.id,
        this.nama,
        this.idJurusan,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
