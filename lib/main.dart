import 'package:flutter/material.dart';
import 'package:flutter_awesome_music_app/screens/appSceens/main.dart';
import 'package:get_it/get_it.dart';
import 'services/global_data.dart';
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
          return const AppScreens();
        },
      ),
    );
  }
}


final getIt = GetIt.instance;
void main() => {
      getIt.registerSingleton<GlobalData>(GlobalData(), signalsReady: true),
      runApp(const App()),
    };
