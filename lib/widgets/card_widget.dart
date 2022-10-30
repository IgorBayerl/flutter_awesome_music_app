import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_music_app/constants.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
// import 'package:flutter_awesome_music_app/widgets/touchable_opacity.dart';

class CardWidget extends StatefulWidget {
  final String urlImage;
  final String title;
  final String subtitle;

  const CardWidget({
    super.key,
    required this.urlImage,
    required this.title,
    required this.subtitle,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 11.0,
          vertical: 10,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey[900],
            image: DecorationImage(
                image: AssetImage(widget.urlImage),
                fit: BoxFit.cover,
                colorFilter:
                  const ColorFilter.mode(Colors.black45, BlendMode.darken),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const Spacer(),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              widget.subtitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            // const SizedBox(
                            //   width: 5,
                            // ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     color: const Color.fromARGB(52, 255, 255, 255),
                            //     borderRadius: BorderRadius.circular(10),
                            //   ),
                            //   child: const Padding(
                            //     padding: EdgeInsets.symmetric(
                            //       horizontal: 10,
                            //       vertical: 3,
                            //     ),
                            //     child: Text(
                            //       'follow',
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 12,
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      
                      children: [
                        // const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onPressed: () {},
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onPressed: () {},
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onPressed: () {},
                            child: const Icon(
                              CupertinoIcons.share,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
              //   child: Row(
              //     children: [
              //       const Icon(
              //         Icons.favorite,
              //         color: Colors.white,
              //         size: 30,
              //       ),
              //       const SizedBox(width: 20),
              //       const Icon(
              //         Icons.download,
              //         color: Colors.white,
              //         size: 30,
              //       ),
              //       const Spacer(),
              //       TouchableOpacity(
              //         onTap: _handlePlaylistButtonClick,
              //         child: const Icon(
              //           Icons.featured_play_list_rounded,
              //           color: Colors.white,
              //           size: 30,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ProgressBar(
                  progress: const Duration(milliseconds: 1000),
                  buffered: const Duration(milliseconds: 2000),
                  total: const Duration(milliseconds: 5000),
                  progressBarColor: kBlue,
                  timeLabelLocation: TimeLabelLocation.sides,
                  timeLabelTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  baseBarColor: Colors.white.withOpacity(0.24),
                  bufferedBarColor: Colors.white.withOpacity(0.24),
                  thumbColor: Colors.white,
                  barHeight: 6.0,
                  thumbRadius: 6.0,
                  thumbGlowRadius: 6,
                  onSeek: (duration) {
                    print(duration);
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
