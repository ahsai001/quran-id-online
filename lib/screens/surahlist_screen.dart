import 'package:flutter/material.dart';
import 'package:quran_id/models/surah_list_response.dart';
import 'package:quran_id/screens/surahdetail_screen.dart';
import 'package:quran_id/services/app_service.dart';

class SurahListScreen extends StatelessWidget {
  const SurahListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Surah List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<List<SurahListItem>>(
            future: AppService.quranService.getSurahList(),
            builder: (context, snapshot) {
              if ((snapshot.connectionState == ConnectionState.none &&
                      snapshot.hasData == false) ||
                  (snapshot.connectionState == ConnectionState.waiting)) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Ada masalah ${snapshot.error.toString()}"),
                );
              } else if (snapshot.data?.isEmpty ?? true) {
                return const Center(
                  child: Text("Ada masalah di datacenter"),
                );
              }
              final list = snapshot.data!;
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final surahItem = list[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SurahDetailScreen(
                              item: surahItem,
                            );
                          },
                        ));
                      },
                      title: Text(
                          "${surahItem.nomor}. ${surahItem.namaLatin}(${surahItem.arti})"),
                      subtitle: Text(
                          "${surahItem.tempatTurun} - ${surahItem.jumlahAyat} ayat"),
                      trailing: const Icon(Icons.menu_book),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    );
                  },
                  itemCount: list.length);
            }),
      ),
    );
  }
}
