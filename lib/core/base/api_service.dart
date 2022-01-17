import 'dart:io';

import '/core/utils/enum/request_type.dart';
import 'package:dio/dio.dart';

class ApiService {
  final BaseOptions _baseOptions = BaseOptions(
      baseUrl: 'https://reqres.in/api/',
      responseType: ResponseType.json,
      headers: const <String, dynamic>{
        HttpHeaders.contentTypeHeader: 'application/json',
      });

  late final Dio _dio;

  ApiService() {
    _dio = Dio(_baseOptions);
  }

  Future handleRawRequest({
    Object? data,
    required final String endpoint,
    required final RequestType requestType,
    final Options? options,
    final Map<String, dynamic>? queryParameters,
  }) async {
    final Future<Response> _dioResponse;

    switch (requestType) {
      case RequestType.post:
        _dioResponse = _dio.post(
          endpoint,
          options: options,
          data: data,
        );
        break;
      default:
        throw Exception('Unsupported request type!');
    }

    try {
      final response = await _dioResponse;

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }

    return null;
  }
}
