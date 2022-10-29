import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_awesome_music_app/screens/appSceens/player/transformers/my_transformer.dart';
import 'package:flutter_awesome_music_app/texts.dart';
import 'package:flutter_awesome_music_app/widgets/card_widget.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:transformer_page_view/transformer_page_view.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const _Header(),
          Expanded(
            child: TransformerPageView(
              scrollDirection: Axis.vertical,
              curve: Curves.easeInBack,
              transformer: MyTransformer(),
              itemCount: Texts.urlImages.length,
              itemBuilder: (context, index) {
                final urlImage = Texts.urlImages[index];
                final title = Texts.titles[index];
                final subtitle = Texts.subtitles[index];

                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom,
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
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FadingListViewWidget();
  }
}

class FadingListViewWidget extends StatelessWidget {
  const FadingListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.purple,
              Colors.transparent,
              Colors.transparent,
              Colors.purple
            ],
            stops: [
              0.0,
              0.08,
              0.92,
              1.0
            ], // 10% purple, 80% transparent, 10% purple
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          children: const [
            TopSelectorButtons(
              innerText: 'Downloaded',
            ),
            TopSelectorButtons(
              innerText: 'Playlist 1',
            ),
            TopSelectorButtons(
              innerText: 'Playlist 2',
            ),
            TopSelectorButtons(
              innerText: 'Playlist',
            ),
            TopSelectorButtons(
              innerText: 'Playlist',
            ),
            TopSelectorButtons(
              innerText: 'Playlist',
            ),
            TopSelectorButtons(
              innerText: 'Playlist',
            ),
          ],
        ),
      ),
    );
  }
}

class TopSelectorButtons extends StatelessWidget {
  const TopSelectorButtons({
    Key? key,
    required this.innerText,
  }) : super(key: key);

  final String innerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Color.fromARGB(36, 255, 255, 255),
        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          alignment: Alignment.center,
          child: Text(
            innerText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
