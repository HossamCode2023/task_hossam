import 'package:dio/dio.dart';

class NetworkManager {
  final Dio _dio;
  const NetworkManager(this._dio);
  Future<Response<T>> request<T>(RequestMethod method, String url,
      {data,
      Map<String, dynamic>? headers, 
      Map<String, dynamic>? queryParameters,
      Function(int count, int total)? onSendProgressm}) {
    return _dio.request(url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: method.value,
          headers: headers,
        ),
        onReceiveProgress: onSendProgressm);
  }
}

enum RequestMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch,
}

extension RequestMethodX on RequestMethod {
  String get value => _getEnumValue(this).toUpperCase();
}

String _getEnumValue(e) => e.toString().split('.').last;
