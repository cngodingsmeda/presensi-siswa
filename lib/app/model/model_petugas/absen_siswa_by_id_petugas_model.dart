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
