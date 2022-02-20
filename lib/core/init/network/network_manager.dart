import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDioNullSafety? coreDio;
  String token = "";

  NetworkManager._init() {
   init();
  }

  Future<void> init() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString("token") ?? "";
    final baseOptions = BaseOptions(
      baseUrl: 'http://test020.internative.net/',
      headers: {
        'Authorization': "Bearer "+token,
      },
    );
    coreDio = CoreDio(baseOptions);
  }
}
