// To parse this JSON data, do
//
//     final surahDetailResponse = surahDetailResponseFromJson(jsonString);

import 'dart:convert';

SurahDetailResponse surahDetailResponseFromJson(String str) {
  final decoded = json.decode(str);
  return SurahDetailResponse.fromJson(decoded);
}

String surahDetailResponseToJson(SurahDetailResponse data) =>
    json.encode(data.toJson());

class SurahDetailResponse {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;
  bool? status;
  List<Ayat>? ayat;
  SuratSenya? suratSelanjutnya;
  SuratSenya? suratSebelumnya;

  SurahDetailResponse({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
    this.status,
    this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  SurahDetailResponse copyWith({
    int? nomor,
    String? nama,
    String? namaLatin,
    int? jumlahAyat,
    String? tempatTurun,
    String? arti,
    String? deskripsi,
    String? audio,
    bool? status,
    List<Ayat>? ayat,
    SuratSenya? suratSelanjutnya,
    SuratSenya? suratSebelumnya,
  }) =>
      SurahDetailResponse(
        nomor: nomor ?? this.nomor,
        nama: nama ?? this.nama,
        namaLatin: namaLatin ?? this.namaLatin,
        jumlahAyat: jumlahAyat ?? this.jumlahAyat,
        tempatTurun: tempatTurun ?? this.tempatTurun,
        arti: arti ?? this.arti,
        deskripsi: deskripsi ?? this.deskripsi,
        audio: audio ?? this.audio,
        status: status ?? this.status,
        ayat: ayat ?? this.ayat,
        suratSelanjutnya: suratSelanjutnya ?? this.suratSelanjutnya,
        suratSebelumnya: suratSebelumnya ?? this.suratSebelumnya,
      );

  factory SurahDetailResponse.fromJson(Map<String, dynamic> json) {
    return SurahDetailResponse(
      nomor: json["nomor"],
      nama: json["nama"],
      namaLatin: json["nama_latin"],
      jumlahAyat: json["jumlah_ayat"],
      tempatTurun: json["tempat_turun"],
      arti: json["arti"],
      deskripsi: json["deskripsi"],
      audio: json["audio"],
      status: json["status"],
      ayat: json["ayat"] == null
          ? []
          : List<Ayat>.from(json["ayat"]!.map((x) => Ayat.fromJson(x))),
      suratSelanjutnya: json["surat_selanjutnya"] == false
          ? null
          : SuratSenya.fromJson(json["surat_selanjutnya"]),
      suratSebelumnya: json["surat_sebelumnya"] == false
          ? null
          : SuratSenya.fromJson(json["surat_sebelumnya"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
        "status": status,
        "ayat": ayat == null
            ? []
            : List<dynamic>.from(ayat!.map((x) => x.toJson())),
        "surat_selanjutnya": suratSelanjutnya?.toJson(),
        "surat_sebelumnya": suratSebelumnya?.toJson(),
      };
}

class Ayat {
  int? id;
  int? surah;
  int? nomor;
  String? ar;
  String? tr;
  String? idn;

  Ayat({
    this.id,
    this.surah,
    this.nomor,
    this.ar,
    this.tr,
    this.idn,
  });

  Ayat copyWith({
    int? id,
    int? surah,
    int? nomor,
    String? ar,
    String? tr,
    String? idn,
  }) =>
      Ayat(
        id: id ?? this.id,
        surah: surah ?? this.surah,
        nomor: nomor ?? this.nomor,
        ar: ar ?? this.ar,
        tr: tr ?? this.tr,
        idn: idn ?? this.idn,
      );

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        id: json["id"],
        surah: json["surah"],
        nomor: json["nomor"],
        ar: json["ar"],
        tr: json["tr"],
        idn: json["idn"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah": surah,
        "nomor": nomor,
        "ar": ar,
        "tr": tr,
        "idn": idn,
      };
}

class SuratSenya {
  int? id;
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;

  SuratSenya({
    this.id,
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
  });

  SuratSenya copyWith({
    int? id,
    int? nomor,
    String? nama,
    String? namaLatin,
    int? jumlahAyat,
    String? tempatTurun,
    String? arti,
    String? deskripsi,
    String? audio,
  }) =>
      SuratSenya(
        id: id ?? this.id,
        nomor: nomor ?? this.nomor,
        nama: nama ?? this.nama,
        namaLatin: namaLatin ?? this.namaLatin,
        jumlahAyat: jumlahAyat ?? this.jumlahAyat,
        tempatTurun: tempatTurun ?? this.tempatTurun,
        arti: arti ?? this.arti,
        deskripsi: deskripsi ?? this.deskripsi,
        audio: audio ?? this.audio,
      );

  factory SuratSenya.fromJson(Map<String, dynamic> json) => SuratSenya(
        id: json["id"],
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: json["tempat_turun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
      };
}
