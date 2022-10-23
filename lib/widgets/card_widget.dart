import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_music_app/constants.dart';

class CardWidget extends StatelessWidget {
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
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey[900],
            image: DecorationImage(
                image: AssetImage(urlImage),
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.black45, BlendMode.darken)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.download,
                      color: Colors.white,
                      size: 30,
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
                  barHeight: 10.0,
                  thumbRadius: 5.0,
                  thumbGlowRadius: 20,
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
