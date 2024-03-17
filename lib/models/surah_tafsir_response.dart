// To parse this JSON data, do
//
//     final surahTafsirResponse = surahTafsirResponseFromJson(jsonString);

import 'dart:convert';

SurahTafsirResponse surahTafsirResponseFromJson(String str) =>
    SurahTafsirResponse.fromJson(json.decode(str));

String surahTafsirResponseToJson(SurahTafsirResponse data) =>
    json.encode(data.toJson());

class SurahTafsirResponse {
  bool? status;
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;
  List<Tafsir>? tafsir;
  SuratSenya? suratSelanjutnya;
  SuratSenya? suratSebelumnya;

  SurahTafsirResponse({
    this.status,
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
    this.tafsir,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  SurahTafsirResponse copyWith({
    bool? status,
    int? nomor,
    String? nama,
    String? namaLatin,
    int? jumlahAyat,
    String? tempatTurun,
    String? arti,
    String? deskripsi,
    String? audio,
    List<Tafsir>? tafsir,
    SuratSenya? suratSelanjutnya,
    SuratSenya? suratSebelumnya,
  }) =>
      SurahTafsirResponse(
        status: status ?? this.status,
        nomor: nomor ?? this.nomor,
        nama: nama ?? this.nama,
        namaLatin: namaLatin ?? this.namaLatin,
        jumlahAyat: jumlahAyat ?? this.jumlahAyat,
        tempatTurun: tempatTurun ?? this.tempatTurun,
        arti: arti ?? this.arti,
        deskripsi: deskripsi ?? this.deskripsi,
        audio: audio ?? this.audio,
        tafsir: tafsir ?? this.tafsir,
        suratSelanjutnya: suratSelanjutnya ?? this.suratSelanjutnya,
        suratSebelumnya: suratSebelumnya ?? this.suratSebelumnya,
      );

  factory SurahTafsirResponse.fromJson(Map<String, dynamic> json) =>
      SurahTafsirResponse(
        status: json["status"],
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: json["tempat_turun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
        tafsir: json["tafsir"] == null
            ? []
            : List<Tafsir>.from(json["tafsir"]!.map((x) => Tafsir.fromJson(x))),
        suratSelanjutnya: json["surat_selanjutnya"] == false
            ? null
            : SuratSenya.fromJson(json["surat_selanjutnya"]),
        suratSebelumnya: json["surat_sebelumnya"] == false
            ? null
            : SuratSenya.fromJson(json["surat_sebelumnya"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
        "tafsir": tafsir == null
            ? []
            : List<dynamic>.from(tafsir!.map((x) => x.toJson())),
        "surat_selanjutnya": suratSelanjutnya?.toJson(),
        "surat_sebelumnya": suratSebelumnya?.toJson(),
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

class Tafsir {
  int? id;
  int? surah;
  int? ayat;
  String? tafsir;

  Tafsir({
    this.id,
    this.surah,
    this.ayat,
    this.tafsir,
  });

  Tafsir copyWith({
    int? id,
    int? surah,
    int? ayat,
    String? tafsir,
  }) =>
      Tafsir(
        id: id ?? this.id,
        surah: surah ?? this.surah,
        ayat: ayat ?? this.ayat,
        tafsir: tafsir ?? this.tafsir,
      );

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json["id"],
        surah: json["surah"],
        ayat: json["ayat"],
        tafsir: json["tafsir"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surah": surah,
        "ayat": ayat,
        "tafsir": tafsir,
      };
}
