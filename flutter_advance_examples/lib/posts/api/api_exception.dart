import 'package:dio/dio.dart';

class ApiException {
  static String getExceptionMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Please check your internet connection';
      case DioExceptionType.sendTimeout:
        return 'Time out, try again late';
      case DioExceptionType.receiveTimeout:
        return 'Time out, try again late';
      case DioExceptionType.badResponse:
        return 'some thing went wrong, try again later';
      case DioExceptionType.cancel:
        return 'Some thing went wrong, try again later';
      default:
        return 'No Internet Connection';
    }
  }
}
