import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
            //input and a go button to search
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search',
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    //search
                  },
                  child: const Text('Go'),
                ),
              ],
            ),

            //search results
          ],
        ),
      ),
    );
  }
}
