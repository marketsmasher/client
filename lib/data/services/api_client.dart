import 'package:dio/dio.dart';
import './auth_service.dart';

final authService = AuthService();

final options = BaseOptions(baseUrl: 'http://10.0.2.2:8080/api/v1');

final api = Dio(options)
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await authService.getToken();
        options.headers['Authorization'] = 'Bearer $token';

        return handler.next(options);
      },
    ),
  )
  ..interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    requestHeader: true,
  ));
