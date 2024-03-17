import 'package:flutter/material.dart';
import 'package:quran_id/models/surah_detail_response.dart';
import 'package:quran_id/models/surah_list_response.dart';
import 'package:quran_id/models/surah_tafsir_response.dart';
import 'package:quran_id/screens/surahtafsir_screen.dart';
import 'package:quran_id/services/app_service.dart';

class SurahDetailScreen extends StatelessWidget {
  final SurahListItem item;
  const SurahDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.namaLatin ?? ""),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SurahTafsirScreen(item: item);
                  },
                ));
              },
              icon: const Icon(Icons.menu_book_sharp))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List>(
            future: AppService.quranService
                .getSurahDetailAndTafsir(item.nomor ?? 0),
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
              final responseList = snapshot.data!;
              SurahDetailResponse detailResponse = responseList[0];
              SurahTafsirResponse tafsirResponse = responseList[1];
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final ayatItem = detailResponse.ayat![index];
                    final tafsirItem = tafsirResponse.tafsir![index];
                    return ListTile(
                      leading: Text(index.toString()),
                      minLeadingWidth: 0,
                      title: Text(
                        ayatItem.ar ?? "",
                        style:
                            const TextStyle(fontFamily: "usmani", fontSize: 30),
                      ),
                      subtitle: Text(ayatItem.idn ?? ""),
                      trailing: IconButton(
                        icon: const Icon(Icons.menu_book),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Tutup"))
                                ],
                                content: SingleChildScrollView(
                                    child: Text(tafsirItem.tafsir ?? "")),
                                scrollable: false,
                                titlePadding: EdgeInsets.zero,
                                title: AppBar(
                                  centerTitle: false,
                                  automaticallyImplyLeading: false,
                                  title: Text(
                                      "Tafsir ${item.namaLatin} ayat ${ayatItem.nomor}"),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    );
                  },
                  itemCount: detailResponse.ayat?.length ?? 0);
            }),
      ),
    );
  }
}
