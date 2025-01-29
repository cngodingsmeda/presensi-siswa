// To parse this JSON data, do
//
//     final jadwalHariAbsenSiswaModel = jadwalHariAbsenSiswaModelFromJson(jsonString);

import 'dart:convert';

JadwalHariAbsenSiswaModel jadwalHariAbsenSiswaModelFromJson(String str) => JadwalHariAbsenSiswaModel.fromJson(json.decode(str));

String jadwalHariAbsenSiswaModelToJson(JadwalHariAbsenSiswaModel data) => json.encode(data.toJson());

class JadwalHariAbsenSiswaModel {
    String? msg;
    List<Datum>? data;

    JadwalHariAbsenSiswaModel({
        this.msg,
        this.data,
    });

    factory JadwalHariAbsenSiswaModel.fromJson(Map<String, dynamic> json) => JadwalHariAbsenSiswaModel(
        msg: json["msg"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? hari;
    String? minJamMulai;
    String? maxJamSelesai;

    Datum({
        this.hari,
        this.minJamMulai,
        this.maxJamSelesai,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        hari: json["hari"],
        minJamMulai: json["min_jam_mulai"],
        maxJamSelesai: json["max_jam_selesai"],
    );

    Map<String, dynamic> toJson() => {
        "hari": hari,
        "min_jam_mulai": minJamMulai,
        "max_jam_selesai": maxJamSelesai,
    };
}
