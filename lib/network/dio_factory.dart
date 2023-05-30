import 'dart:io';

import 'package:dio/dio.dart';

Dio apiDioFactory() {
  final dio = Dio();
  dio.interceptors.add(AuthInterceptors());
  dio.options.baseUrl = 'https://api2.megaohm.ru:44399/test';

  final headers = dio.options.headers;
  headers[HttpHeaders.acceptHeader] = "application/json";
  headers[HttpHeaders.contentTypeHeader] = "application/json";

  return dio;
}

class AuthInterceptors extends Interceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJtZWdhb2htLnJ1IiwiYXVkIjoiYXJjIiwic3ViIjoiYXQiLCJuYmYiOjE2ODMxOTkwMzcuMjI4ODM4NywiZXhwIjoxNzE0NzM1MDM3LjIyODg0Mjd9.Y3gl3QOdpiZ6PLvKGOwwJIxL9yMbMLXXzoK2dDJNgh8';
    options.headers
        .putIfAbsent(HttpHeaders.authorizationHeader, () => "Bearer $token");
    return super.onRequest(options, handler);
  }
}
