import 'package:flutter/material.dart';
import 'package:flutter_awesome_music_app/screens/appSceens/main.dart';

import 'screens/onboarding/onboarding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Concept',
      home: Builder(
        builder: (BuildContext context) {
          final screenHeight = MediaQuery.of(context).size.height;

          // return Onboarding(screenHeight: screenHeight);
          return AppScreens();
        },
      ),
    );
  }
}

void main() => runApp(const App());
