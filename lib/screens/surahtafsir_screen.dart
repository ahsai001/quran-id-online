import 'package:flutter/material.dart';
import 'package:quran_id/models/surah_list_response.dart';
import 'package:quran_id/models/surah_tafsir_response.dart';
import 'package:quran_id/services/app_service.dart';

class SurahTafsirScreen extends StatelessWidget {
  final SurahListItem item;
  const SurahTafsirScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tafsir ${item.namaLatin}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<SurahTafsirResponse>(
            future: AppService.quranService.getSurahTafsir(item.nomor ?? 0),
            builder: (context, snapshot) {
              if ((snapshot.connectionState == ConnectionState.none &&
                      snapshot.hasData == false) ||
                  (snapshot.connectionState == ConnectionState.waiting)) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Ada masalah ${snapshot.error.toString()}"),
                );
              }
              final response = snapshot.data!;
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final tafsirItem = response.tafsir![index];
                    return ListTile(
                      leading: Text(index.toString()),
                      minLeadingWidth: 0,
                      title: Text(
                        tafsirItem.tafsir ?? "",
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    );
                  },
                  itemCount: response.tafsir?.length ?? 0);
            }),
      ),
    );
  }
}
