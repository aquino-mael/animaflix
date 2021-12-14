import 'http_method.dart';

abstract class HttpClient {
  Future<Map<String, dynamic>> request({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
