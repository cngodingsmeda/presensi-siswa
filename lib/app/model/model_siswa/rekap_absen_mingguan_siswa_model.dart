// To parse this JSON data, do
//
//     final rekapMingguanSiswaModel = rekapMingguanSiswaModelFromJson(jsonString);

import 'dart:convert';

RekapMingguanSiswaModel rekapMingguanSiswaModelFromJson(String str) => RekapMingguanSiswaModel.fromJson(json.decode(str));

String rekapMingguanSiswaModelToJson(RekapMingguanSiswaModel data) => json.encode(data.toJson());

class RekapMingguanSiswaModel {
    String? msg;
    Data? data;

    RekapMingguanSiswaModel({
        this.msg,
        this.data,
    });

    factory RekapMingguanSiswaModel.fromJson(Map<String, dynamic> json) => RekapMingguanSiswaModel(
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
    };
}

class Data {
    List<Progress>? progress;
    int? totalHadir;
    int? totalIzinSakitDispensasi;

    Data({
        this.progress,
        this.totalHadir,
        this.totalIzinSakitDispensasi,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        progress: json["progress"] == null ? [] : List<Progress>.from(json["progress"]!.map((x) => Progress.fromJson(x))),
        totalHadir: json["total_hadir"],
        totalIzinSakitDispensasi: json["total_izin_sakit_dispensasi"],
    );

    Map<String, dynamic> toJson() => {
        "progress": progress == null ? [] : List<dynamic>.from(progress!.map((x) => x.toJson())),
        "total_hadir": totalHadir,
        "total_izin_sakit_dispensasi": totalIzinSakitDispensasi,
    };
}

class Progress {
    String? hari;
    String? status;

    Progress({
        this.hari,
        this.status,
    });

    factory Progress.fromJson(Map<String, dynamic> json) => Progress(
        hari: json["hari"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "hari": hari,
        "status": status,
    };
}
