import 'package:quran_id/models/surah_detail_response.dart';
import 'package:quran_id/models/surah_list_response.dart';
import 'package:quran_id/models/surah_tafsir_response.dart';
import 'package:quran_id/repositories/quran_repository.dart';

class QuranService {
  final QuranRepository repository;
  QuranService(this.repository);

  Future<List<SurahListItem>> getSurahList() {
    return repository.getSurahList();
  }

  Future<SurahDetailResponse> getSurahDetail(int surah) {
    return repository.getSurahDetail(surah);
  }

  Future<SurahTafsirResponse> getSurahTafsir(int surah) {
    return repository.getSurahTafsir(surah);
  }

  Future<List> getSurahDetailAndTafsir(int surah) {
    return Future.wait([getSurahDetail(surah), getSurahTafsir(surah)]);
  }
}
