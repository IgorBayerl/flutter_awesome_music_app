import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_music_app/screens/appSceens/player/transformers/my_transformer.dart';
import 'package:flutter_awesome_music_app/services/global_data.dart';
import 'package:flutter_awesome_music_app/texts.dart';
import 'package:flutter_awesome_music_app/widgets/card_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:transformer_page_view/transformer_page_view.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({
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
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(57, 0, 0, 0),
      ),
      child: SafeArea(
        bottom: false,
        top: false,
        child: Column(
          children: [
            // _Header(),
            // _MusicsList(),
            _MusicsListTop(),
            _Footer(),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  _Footer({super.key});

  final GlobalData globalData = GetIt.I.get<GlobalData>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 180,
      child: IntrinsicHeight(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: ShaderMask(
                blendMode: BlendMode.dstOut,
                shaderCallback: (Rect rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(130, 0, 0, 0),
                      Color.fromARGB(130, 0, 0, 0),
                    ],
                    stops: [
                      0.0,
                      0.5,
                      1.0
                    ], // 10% purple, 80% transparent, 10% purple
                  ).createShader(rect);
                },
                child: const Image(
                  image: AssetImage('assets/images/1msc.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom,
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              globalData.data["name"]!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const Text(
                              'Current Music',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        minWidth: 0,
                        height: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            CupertinoIcons.shuffle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        minWidth: 0,
                        height: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            CupertinoIcons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   height: 50,
                  //   color: Colors.purple,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 180,
      child: IntrinsicHeight(
        child: Stack(
          children: <Widget>[
            Container(
              height: 190,
              width: double.infinity,
              child: ShaderMask(
                blendMode: BlendMode.dstOut,
                shaderCallback: (Rect rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Color.fromARGB(255, 255, 255, 255),
                    ],
                    stops: [
                      0.0,
                      0.5,
                      1.0
                    ], // 10% purple, 80% transparent, 10% purple
                  ).createShader(rect);
                },
                child: const Image(
                  image: AssetImage('assets/images/1msc.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SizedBox(
                  //   height: MediaQuery.of(context).padding.top + 40,
                  // ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          CupertinoIcons.repeat,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          CupertinoIcons.shuffle,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Playlist',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Playlist Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          CupertinoIcons.search,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                  // Container(
                  //   height: 50,
                  //   color: Colors.purple,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MusicsListTop extends StatelessWidget {
  _MusicsListTop();

  final _scrollController = ScrollController(
    initialScrollOffset: 40,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ShaderMask(
        blendMode: BlendMode.dstOut,
        shaderCallback: (Rect rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Colors.transparent,
              Colors.transparent,
              Color.fromARGB(255, 255, 255, 255),
            ],
            stops: [
              0.0,
              0.2,
              0.95,
              1.0
            ], // 10% purple, 80% transparent, 10% purple
          ).createShader(rect);
        },
        child: ReorderableListView.builder(
          scrollController: _scrollController,
          reverse: true,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: 10,
          ),
          proxyDecorator:
              (Widget child, int index, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          onReorder: (int oldIndex, int newIndex) {},
          itemCount: 20,
          // scrollController: ScrollController(),
          itemBuilder: (BuildContext context, int index) {
            return PlaylistItemTile(
              key: Key('$index'),
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class PlaylistItemTile extends StatelessWidget {
  const PlaylistItemTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key('$index'),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext) => {},
            backgroundColor: const Color.fromARGB(48, 39, 39, 39),
            foregroundColor: Colors.white,
            icon: Icons.remove_circle,
            label: 'Inativate',
          ),
        ],
      ),

      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext) => {},
            backgroundColor: const Color.fromARGB(50, 0, 0, 0),
            foregroundColor: Colors.white,
            icon: Icons.settings,
            // label: 'Save',
          ),
          SlidableAction(
            onPressed: (BuildContext) => {},
            backgroundColor: const Color.fromARGB(90, 0, 0, 0),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            // label: 'Delete',
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: PlayListTile(
        index: index,
      ),
    );
  }
}

class _MusicsList extends StatelessWidget {
  _MusicsList();

  final _scrollController = ScrollController(
    initialScrollOffset: -40,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ShaderMask(
        blendMode: BlendMode.dstOut,
        shaderCallback: (Rect rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Colors.transparent,
              Colors.transparent,
              Color.fromARGB(255, 255, 255, 255),
            ],
            stops: [
              0.0,
              0.05,
              0.8,
              1.0
            ], // 10% purple, 80% transparent, 10% purple
          ).createShader(rect);
        },
        child: ReorderableListView.builder(
          scrollController: _scrollController,
          padding: EdgeInsets.only(
            top: 10,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          onReorder: (int oldIndex, int newIndex) {},
          itemCount: 20,
          // scrollController: ScrollController(),
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              // Specify a key if the Slidable is dismissible.
              key: Key('$index'),

              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),

                // A pane can dismiss the Slidable.
                // dismissible: DismissiblePane(onDismissed: () {}),

                // All actions are defined in the children parameter.
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: (BuildContext) => {},
                    backgroundColor: const Color.fromARGB(48, 39, 39, 39),
                    foregroundColor: Colors.white,
                    icon: Icons.remove_circle,
                    label: 'Inativate',
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.
              endActionPane: ActionPane(
                // dismissible: DismissiblePane(onDismissed: () {}),
                motion: const ScrollMotion(),
                children: [
                  // SlidableAction(
                  //   // An action can be bigger than the others.
                  //   flex: 2,
                  //   onPressed: (BuildContext) => {},
                  //   backgroundColor: const Color(0xFF7BC043),
                  //   foregroundColor: Colors.white,
                  //   icon: Icons.archive,
                  //   label: 'Archive',
                  // ),
                  SlidableAction(
                    onPressed: (BuildContext) => {},
                    backgroundColor: const Color.fromARGB(50, 0, 0, 0),
                    foregroundColor: Colors.white,
                    icon: Icons.settings,
                    // label: 'Save',
                  ),
                  SlidableAction(
                    onPressed: (BuildContext) => {},
                    backgroundColor: const Color.fromARGB(90, 0, 0, 0),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    // label: 'Delete',
                  ),
                ],
              ),

              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: PlayListTile(
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }
}

class PlayListTile extends StatelessWidget {
  const PlayListTile({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    const shadow = Shadow(
      blurRadius: 10.0,
      color: Color.fromARGB(136, 0, 0, 0),
    );
    return MaterialButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              '$index',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image(
                image: AssetImage('assets/images/1msc.jpg'),
                height: 50,
                width: 50,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Music Name',
                        style: TextStyle(
                          color: index != 5
                              ? Colors.white
                              : const Color.fromARGB(255, 171, 148, 255),
                          fontWeight: FontWeight.bold,
                          shadows: const [shadow],
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'SAKJDLALSKDJALSDK',
                        style: TextStyle(
                          color: index != 5
                              ? const Color.fromARGB(157, 255, 255, 255)
                              : const Color.fromARGB(255, 183, 163, 255),
                          shadows: const [shadow],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '3:45',
                    style: TextStyle(
                      color: index != 5
                          ? Colors.white
                          : const Color.fromARGB(255, 171, 148, 255),
                      shadows: const [shadow],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
