import 'package:flutter/material.dart';
import 'package:flutter_awesome_music_app/screens/appSceens/search/widgets/search_result_tile.dart';
import 'package:flutter_awesome_music_app/services/global_data.dart';
import 'package:flutter_awesome_music_app/services/search_service.dart';
import 'package:get_it/get_it.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchTextController = TextEditingController();
  // late Response response;
  late List musics = [];
  bool isLoading = false;

  final GlobalData globalData = GetIt.I.get<GlobalData>();

  Future<void> _handleOnPressSearch() async {
    setState(() => isLoading = true);
    try {
      final musicsRes = await searchMusicsService(_searchTextController.text);
      if (musicsRes.isNotEmpty) setState(() => musics = musicsRes);
    } catch (e) {
      print(e);
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: const Text('Search'),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _searchTextController,
                      decoration: const InputDecoration(
                        hintText: 'Search',
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: _handleOnPressSearch,
                  child: const Text('Search'),
                ),
              ],
            ),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: musics.length,
                itemBuilder: (BuildContext context, int index) {
                  return SearchResultTile(
                    title: musics[index]['title'],
                    albumArtUrl: musics[index]['thumbnail']['url'],
                    artist: musics[index]['channel']['name'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
