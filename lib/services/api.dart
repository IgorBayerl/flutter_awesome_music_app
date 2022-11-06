import 'package:dio/dio.dart';
import 'package:flutter_awesome_music_app/services/global_data.dart';
import 'package:get_it/get_it.dart';

final GlobalData globalData = GetIt.I.get<GlobalData>();

final api = Dio(
  BaseOptions(
    baseUrl: globalData.data["serverUrl"] ?? 'http://10.0.2.2:3000',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ),
);
