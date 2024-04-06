import 'package:dio/dio.dart';

class ApiService {
  final int _defaultConnectTimeout = 30 * 1000; // 30 sec
  final int _defaultReceiveTimeout = 60 * 1000; // 60 sec

  late Dio _dio;

  Dio get instance => _dio;

  ApiService() {
    _dio = Dio()
      ..options.connectTimeout = Duration(seconds: _defaultConnectTimeout)
      ..options.receiveTimeout = Duration(seconds: _defaultReceiveTimeout);
  }
}
