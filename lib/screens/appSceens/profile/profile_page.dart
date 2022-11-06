import 'package:flutter/material.dart';
import 'package:flutter_awesome_music_app/screens/appSceens/search/widgets/search_result_tile.dart';
import 'package:flutter_awesome_music_app/services/global_data.dart';
import 'package:flutter_awesome_music_app/services/search_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalData globalData = GetIt.I.get<GlobalData>();
  final TextEditingController _inputTextController = TextEditingController();

  Future<void> _handleOnPressSave() async {
    setState(() {
      globalData.data["serverUrl"] = _inputTextController.text;
    });
    globalData.persistGlobalData();
    Fluttertoast.showToast(msg: 'Saved');
  }

  @override
  void initState() {
    setState(() {
      _inputTextController.text = globalData.data["serverUrl"]!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: const Text('Profile'),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _inputTextController,
                      decoration: const InputDecoration(
                        hintText: 'Server URL',
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: _handleOnPressSave,
                  child: const Text('Save'),
                ),
              ],
            ),
            Text(globalData.data["serverUrl"]!),
          ],
        ),
      ),
    );
  }
}
