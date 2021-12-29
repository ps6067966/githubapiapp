import 'package:dio/dio.dart';

Dio dio = Dio(BaseOptions(connectTimeout: 500000, receiveTimeout: 500000,));
String baseUrl = 'https://api.github.com/users/JakeWharton/repos?page=1&per_page=15';