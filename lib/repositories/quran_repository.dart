import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quran_id/models/surah_detail_response.dart';
import 'package:quran_id/models/surah_list_response.dart';
import 'package:quran_id/models/surah_tafsir_response.dart';

class QuranRepository {
  final dio = Dio();
  Future<List<SurahListItem>> getSurahList() async {
    try {
      final response = await dio.get("https://equran.id/api/surat",
          options: Options(responseType: ResponseType.json));
      //transformasi/convert json to object
      return compute(surahListItemFromJson, jsonEncode(response.data));
    } catch (e) {
      throw e.toString();
    }
  }

  Future<SurahDetailResponse> getSurahDetail(int surah) async {
    try {
      final response = await dio.get("https://equran.id/api/surat/$surah",
          options: Options(responseType: ResponseType.json));
      //transformasi/convert json to object
      return compute(surahDetailResponseFromJson, jsonEncode(response.data));
    } catch (e) {
      throw e.toString();
    }
  }

  Future<SurahTafsirResponse> getSurahTafsir(int surah) async {
    try {
      final response = await dio.get("https://equran.id/api/tafsir/$surah",
          options: Options(responseType: ResponseType.json));
      //transformasi/convert json to object
      return compute(surahTafsirResponseFromJson, jsonEncode(response.data));
    } catch (e) {
      throw e.toString();
    }
  }
}
