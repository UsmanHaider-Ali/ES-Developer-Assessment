import 'package:dio/dio.dart';
import 'package:es_developer_assessment/data/api/api_services.dart';
import 'package:es_developer_assessment/domain/exceptions/exceptions.dart';
import 'package:es_developer_assessment/utils/functions.dart';
import 'package:flutter/material.dart';

class DioClient extends ApiServices {
  final Dio dio;
  final String apiKey;

  DioClient({required this.dio, required this.apiKey}) {
    dio.interceptors.addAll([ApiKeyInterceptor(apiKey: apiKey), ConnectivityInterceptor()]);
  }

  @override
  Future getService(String url, dynamic params, dynamic headers) async {
    dynamic jsonResponse;

    try {
      final response = await dio.get(url, queryParameters: params, options: Options(headers: headers));
      jsonResponse = handleResponse(response);
    } on DioException catch (e) {
      debugPrint("DioError => ${e.error}");
      throw FetchDataException("${e.error}");
    } catch (e) {
      debugPrint("Exception => $e");
      throw Exception("An unexpected error occurred.");
    }

    debugPrint('Response of $url: $jsonResponse');

    return jsonResponse;
  }
}

class ApiKeyInterceptor extends Interceptor {
  final String apiKey;

  ApiKeyInterceptor({required this.apiKey});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['api_key'] = apiKey;
    handler.next(options);
  }
}

class ConnectivityInterceptor extends Interceptor {
  ConnectivityInterceptor();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final isConnected = await isConnectedToInternet();
    if (!isConnected) {
      return handler.reject(
        DioException(requestOptions: options, error: 'No internet connection', type: DioExceptionType.connectionError),
        true,
      );
    }
    return super.onRequest(options, handler);
  }
}

dynamic handleResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response.data;
    case 400:
      throw BadRequestException(response.data.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.data.toString());
    default:
      throw FetchDataException("Error occurred while communicating with server with status code: ${response.statusCode}");
  }
}
