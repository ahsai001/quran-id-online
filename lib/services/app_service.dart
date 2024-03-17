import 'package:quran_id/repositories/quran_repository.dart';
import 'package:quran_id/services/quran_service.dart';

final _quranRepository = QuranRepository();
final _quranService = QuranService(_quranRepository);

class AppService {
  static QuranService get quranService {
    return _quranService;
  }
}
