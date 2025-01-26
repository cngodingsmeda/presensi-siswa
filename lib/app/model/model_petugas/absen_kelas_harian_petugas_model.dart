class AbsenKelasHarianPetugasModel {
  String? msg;
  AbsenData? data;

  AbsenKelasHarianPetugasModel({this.msg, this.data});

  factory AbsenKelasHarianPetugasModel.fromJson(Map<String, dynamic> json) {
    return AbsenKelasHarianPetugasModel(
      msg: json['msg'],
      data: json['data'] != null ? AbsenData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'msg': msg,
      'data': data?.toJson(),
    };
  }
}

class AbsenData {
  int? countData;
  int? countPage;
  int? jumlahSiswa;
  GuruWalas? guruWalas;
  Map<String, Map<String, dynamic>?>? absen;

  AbsenData({
    this.countData,
    this.countPage,
    this.jumlahSiswa,
    this.guruWalas,
    this.absen,
  });

  factory AbsenData.fromJson(Map<String, dynamic> json) {
    // Parsing absen as a nested map
    var absenMap =
        (json['absen'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(
              key,
              (value as Map<String, dynamic>?)?.map(
                (innerKey, innerValue) => MapEntry(innerKey, innerValue),
              ),
            ));

    return AbsenData(
      countData: json['count_data'],
      countPage: json['count_page'],
      jumlahSiswa: json['jumlah_siswa'],
      guruWalas: json['guru_walas'] != null
          ? GuruWalas.fromJson(json['guru_walas'])
          : null,
      absen: absenMap,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count_data': countData,
      'count_page': countPage,
      'jumlah_siswa': jumlahSiswa,
      'guru_walas': guruWalas?.toJson(),
      'absen': absen?.map(
        (key, value) => MapEntry(
          key,
          value?.map((innerKey, innerValue) => MapEntry(innerKey, innerValue)),
        ),
      ),
    };
  }
}

class GuruWalas {
  int? id;
  String? nip;
  String? nama;
  String? noTelepon;
  String? email;
  String? jenisKelamin;
  String? tempatLahir;
  String? tanggalLahir;
  String? agama;
  String? fotoProfile;
  int? idSekolah;
  int? idTahun;
  int? idKelas;
  String? tokenFCM;

  GuruWalas({
    this.id,
    this.nip,
    this.nama,
    this.noTelepon,
    this.email,
    this.jenisKelamin,
    this.tempatLahir,
    this.tanggalLahir,
    this.agama,
    this.fotoProfile,
    this.idSekolah,
    this.idTahun,
    this.idKelas,
    this.tokenFCM,
  });

  factory GuruWalas.fromJson(Map<String, dynamic> json) {
    return GuruWalas(
      id: json['id'],
      nip: json['nip'],
      nama: json['nama'],
      noTelepon: json['no_telepon'],
      email: json['email'],
      jenisKelamin: json['jenis_kelamin'],
      tempatLahir: json['tempat_lahir'],
      tanggalLahir: json['tanggal_lahir'],
      agama: json['agama'],
      fotoProfile: json['foto_profile'],
      idSekolah: json['id_sekolah'],
      idTahun: json['id_tahun'],
      idKelas: json['id_kelas'],
      tokenFCM: json['token_FCM'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nip': nip,
      'nama': nama,
      'no_telepon': noTelepon,
      'email': email,
      'jenis_kelamin': jenisKelamin,
      'tempat_lahir': tempatLahir,
      'tanggal_lahir': tanggalLahir,
      'agama': agama,
      'foto_profile': fotoProfile,
      'id_sekolah': idSekolah,
      'id_tahun': idTahun,
      'id_kelas': idKelas,
      'token_FCM': tokenFCM,
    };
  }
}
