import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_awesome_music_app/screens/appSceens/player/player_page.dart';
import 'package:flutter_awesome_music_app/screens/appSceens/playlist/playlist_page.dart';
import 'package:flutter_awesome_music_app/screens/appSceens/profile/profile_page.dart';
import 'package:flutter_awesome_music_app/screens/appSceens/search/search_page.dart';
import 'package:flutter_awesome_music_app/services/global_data.dart';
import 'package:get_it/get_it.dart';

class AppScreens extends StatefulWidget {
  const AppScreens({super.key});

  @override
  State<AppScreens> createState() => _AppScreensState();
}

class _AppScreensState extends State<AppScreens>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController(
    initialPage: 1,
  );

  late Animation<Color> bgAnimation;

  int _selectedPageIndex = 1;

  final GlobalData globalData = GetIt.I.get<GlobalData>();
  @override
  void initState() {
    super.initState();
    _initGlobalData();
  }

  Future<void> _initGlobalData() async {
    globalData.loadGlobalData().then((resData) {
      setState(() => globalData.data = resData);
    });
  }

  void _handleOnCLickBottomNav(int index) {
    setState(() {
      _selectedPageIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      // _pageController.jumpToPage(index);
    });
  }

  void _handlePageChanged(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xffffb56b),
                Color(0xfff39060),
                Color(0xffe16b5c),
                Color(0xffca485c),
                Color(0xffac255e),
                Color(0xff870160),
                Color(0xff5b0060),
                Color(0xff1f005c),
              ], // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            )),
          ),
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: _handlePageChanged,
            children: const <Widget>[
              PlaylistPage(),
              PlayerPage(),
              SearchPage(),
              ProfilePage(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromARGB(0, 0, 0, 0),
                Color.fromARGB(121, 0, 0, 0),
                Color.fromARGB(209, 0, 0, 0),
              ]),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.featured_play_list_rounded),
              label: 'Playlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.play_arrow_solid),
              label: 'Player',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: 'Downloads',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedPageIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: const Color.fromARGB(172, 203, 192, 248),
          unselectedItemColor: const Color.fromARGB(255, 214, 214, 214),
          backgroundColor: Colors.transparent,
          onTap: _handleOnCLickBottomNav,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
      ),
    );
  }
}
