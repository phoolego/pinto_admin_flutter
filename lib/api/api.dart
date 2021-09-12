import 'package:dio/dio.dart';

class Api {
  static Dio dio = Dio(BaseOptions(
    baseUrl: 'http://pintobangkachao.sit.kmutt.ac.th:3000',
  ));
}