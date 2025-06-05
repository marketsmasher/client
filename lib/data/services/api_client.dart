import 'package:client/ui/auth/view_models/login_model.dart';
import 'package:dio/dio.dart';

final options = BaseOptions(baseUrl: 'http://10.0.2.2:8080/api/v1');

final api = Dio(options)
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = authService.getToken();
        options.headers['Authorization'] = 'Bearer $token';

        return handler.next(options);
      },
    ),
  );
