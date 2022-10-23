import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_music_app/constants.dart';

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
  void _handlePlaylistButtonClick() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                color: Colors.red,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey[900],
            image: DecorationImage(
                image: AssetImage(widget.urlImage),
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.black45, BlendMode.darken)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                widget.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
              const SizedBox(height: 5),
              Text(
                widget.subtitle,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.download,
                      color: Colors.white,
                      size: 30,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.featured_play_list_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: _handlePlaylistButtonClick,
                    )
                  ],
                ),
              ),
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
                  barHeight: 30.0,
                  thumbRadius: 15.0,
                  thumbGlowRadius: 30,
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
