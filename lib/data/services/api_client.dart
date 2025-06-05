import 'package:dio/dio.dart';

final options = BaseOptions(
    baseUrl: 'http://10.0.2.2:8080/api/v1'
);

final api = Dio(options);
