class AbsenKelasHarianWalasModel {
  String? msg;
  Data? data;

  AbsenKelasHarianWalasModel({this.msg, this.data});

  factory AbsenKelasHarianWalasModel.fromJson(Map<String, dynamic> json) {
    return AbsenKelasHarianWalasModel(
      msg: json['msg'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'msg': msg,
      'data': data?.toJson(),
    };
  }
}

class Data {
  int? countData;
  int? countPage;
  Map<String, Map<String, AbsenDetail>>? absen;

  Data({this.countData, this.countPage, this.absen});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      countData: json['count_data'],
      countPage: json['count_page'],
      absen: json['absen'] != null
          ? (json['absen'] as Map<String, dynamic>).map((namaSiswa, value) {
              return MapEntry(
                namaSiswa,
                (value as Map<String, dynamic>).map((key, value) {
                  return MapEntry(key, AbsenDetail.fromJson(value));
                }),
              );
            })
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count_data': countData,
      'count_page': countPage,
      'absen': absen?.map((namaSiswa, value) {
        return MapEntry(
          namaSiswa,
          value.map((key, value) => MapEntry(key, value.toJson())),
        );
      }),
    };
  }
}

class AbsenDetail {
  int? id;
  int? idJadwal;
  int? idSiswa;
  String? tanggal;
  String? jam;
  String? file;
  String? status;

  AbsenDetail({
    this.id,
    this.idJadwal,
    this.idSiswa,
    this.tanggal,
    this.jam,
    this.file,
    this.status,
  });

  factory AbsenDetail.fromJson(Map<String, dynamic> json) {
    return AbsenDetail(
      id: json['id'],
      idJadwal: json['id_jadwal'],
      idSiswa: json['id_siswa'],
      tanggal: json['tanggal'],
      jam: json['jam'],
      file: json['file'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_jadwal': idJadwal,
      'id_siswa': idSiswa,
      'tanggal': tanggal,
      'jam': jam,
      'file': file,
      'status': status,
    };
  }
}
