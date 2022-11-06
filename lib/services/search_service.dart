import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_awesome_music_app/services/api.dart';

Future<List> searchMusicsService(String searchText) async {
  final Response response = await api.get(
    '/search',
    queryParameters: {'query': searchText, 'limit': '5'},
  );

  if (response.statusCode != 200) throw Exception('Error');

  if (response.data['status'] == 'warning') {
    Fluttertoast.showToast(msg: response.data['message']);
  }

  if (response.data['data'].length > 0) {
    return response.data['data'];
  }
  return [];
}
