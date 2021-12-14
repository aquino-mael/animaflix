import 'dart:developer';

import 'package:dio/dio.dart';

import '../../data/http/http.dart';

class HttpAdapter implements HttpClient {
  final Dio client;

  HttpAdapter({
    required this.client,
  });

  @override
  Future<Map<String, dynamic>> request({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    log(url, name: 'HTTP REQUEST');

    late Response response;

    switch (method) {
      case HttpMethod.GET:
        response = await client.get(
          url,
          queryParameters: queryParameters,
        );
        break;
      default:
    }

    return response.data;
  }
}
