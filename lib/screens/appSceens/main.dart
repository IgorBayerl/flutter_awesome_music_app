import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_awesome_music_app/constants.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

import '../../texts.dart';
import '../../widgets/card_widget.dart';
import 'player/transformers/my_transformer.dart';

class AppScreens extends StatefulWidget {
  const AppScreens({super.key});

  @override
  State<AppScreens> createState() => _AppScreensState();
}

class _AppScreensState extends State<AppScreens>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController();
  final _musicPageController = PageController();

  /// animation controller
  late final AnimationController _bgAnimationController;
  late Animation<Color> bgAnimation;

  static const _bgImg = AssetImage('assets/images/1msc.jpg');

  int _selectedPageIndex = 0;
  int _selectedMusicPageIndex = 0;

  get placeholder => null;

  @override
  void initState() {
    super.initState();
    _bgAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
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
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _handlePageChanged,
        children: <Widget>[
          Scaffold(
            body: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey[900],
                image: const DecorationImage(
                  image: AssetImage('assets/images/1msc.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.black54,
                    ),
                  ),
                  SafeArea(
                    // maintainBottomViewPadding: true,
                    bottom: false,

                    // top: false,
                    child: TransformerPageView(
                      scrollDirection: Axis.vertical,
                      curve: Curves.easeInBack,
                      transformer: MyTransformer(), // transformers[5],
                      itemCount: Texts.urlImages.length,
                      itemBuilder: (context, index) {
                        final urlImage = Texts.urlImages[index];
                        final title = Texts.titles[index];
                        final subtitle = Texts.subtitles[index];

                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            MediaQuery.of(context).padding.bottom,
                          ),
                          child: CardWidget(
                            urlImage: urlImage,
                            title: title,
                            subtitle: subtitle,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 207, 132, 34),
          ),
          Container(
            color: const Color.fromARGB(255, 27, 24, 223),
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
              icon: Icon(Icons.discord),
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
          selectedItemColor: const Color.fromARGB(255, 233, 233, 233),
          unselectedItemColor: const Color.fromARGB(255, 214, 214, 214),
          backgroundColor: Colors.transparent,
          onTap: _handleOnCLickBottomNav,
          elevation: 0,
        ),
      ),
    );
  }
}
