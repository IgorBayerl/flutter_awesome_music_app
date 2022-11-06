import 'package:shared_preferences/shared_preferences.dart';

class GlobalData {
  Map<String, String> data = {
    "serverUrl": 'http://10.0.2.2:3',
    "name": 'Global Data',
  };

  void persistGlobalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('serverUrl', data["serverUrl"]!);
    prefs.setString('name', data["name"]!);
  }

  Future<Map<String, String>> loadGlobalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    data["serverUrl"] = prefs.getString('serverUrl')!;
    data["name"] = prefs.getString('name')!;
    return data;
  }
}
