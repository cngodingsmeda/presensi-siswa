class LaporanPelajaranKelasWalasModel {
  final String? msg;
  final Data? data;

  LaporanPelajaranKelasWalasModel({this.msg, this.data});

  factory LaporanPelajaranKelasWalasModel.fromJson(Map<String, dynamic> json) => 
      LaporanPelajaranKelasWalasModel(
        msg: json["msg"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
      };
}

class Data {
  final int? countData;
  final int? countPage;
  final Map<String, Map<String, AbsenRecord>>? absen;

  Data({this.countData, this.countPage, this.absen});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        countData: json["count_data"],
        countPage: json["count_page"],
        absen: json["absen"] != null
            ? (json["absen"] as Map<String, dynamic>).map(
                (key, value) => MapEntry(
                  key,
                  (value as Map<String, dynamic>).map(
                    (innerKey, innerValue) => MapEntry(
                      innerKey,
                      AbsenRecord.fromJson(innerValue),
                    ),
                  ),
                ),
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "count_data": countData,
        "count_page": countPage,
        "absen": absen?.map(
          (key, value) => MapEntry(
            key,
            value.map((innerKey, innerValue) => MapEntry(innerKey, innerValue.toJson())),
          ),
        ),
      };
}

class AbsenRecord {
  final int? id;
  final int? idJadwal;
  final int? idSiswa;
  final DateTime? tanggal;
  final String? jam;
  final String? file;
  final String? status;

  AbsenRecord({
    this.id,
    this.idJadwal,
    this.idSiswa,
    this.tanggal,
    this.jam,
    this.file,
    this.status,
  });

  factory AbsenRecord.fromJson(Map<String, dynamic> json) => AbsenRecord(
        id: json["id"],
        idJadwal: json["id_jadwal"],
        idSiswa: json["id_siswa"],
        tanggal: json["tanggal"] != null ? DateTime.tryParse(json["tanggal"]) : null,
        jam: json["jam"],
        file: json["file"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_jadwal": idJadwal,
        "id_siswa": idSiswa,
        "tanggal": tanggal != null ? tanggal!.toIso8601String().split('T')[0] : null,
        "jam": jam,
        "file": file,
        "status": status,
      };
}
