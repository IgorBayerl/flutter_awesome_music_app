import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchResultTile extends StatelessWidget {
  SearchResultTile({
    super.key,
    required this.title,
    required this.artist,
    required this.albumArtUrl,
  });

  String title;
  String artist;
  String albumArtUrl;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Image.network(albumArtUrl),
          ),
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
