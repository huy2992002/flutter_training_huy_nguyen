// ignore_for_file: no_default_cases

import 'package:dio/dio.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/main.dart';
import 'package:nike_sneaker_store/services/handle_error/failure.dart';

extension ErrorEx on DioException {
  Failure getFailure() {
    final mContext = scaffoldMessengerKey.currentState!.context;

    switch (type) {
      case DioExceptionType.cancel:
        return Failure(
          ResponseCode.cancel,
          AppLocalizations.of(mContext).cancelError,
        );
      case DioExceptionType.connectionTimeout:
        return Failure(
          ResponseCode.connectTimeout,
          AppLocalizations.of(mContext).connectionTimeOutError,
        );
      case DioExceptionType.receiveTimeout:
        return Failure(
          ResponseCode.receiveTimeout,
          AppLocalizations.of(mContext).receiveTimeoutError,
        );
      case DioExceptionType.badResponse:
        return Failure(
          ResponseCode.badRequest,
          AppLocalizations.of(mContext).badResponseError,
        );
      case DioExceptionType.sendTimeout:
        return Failure(
          ResponseCode.sendTimeout,
          AppLocalizations.of(mContext).sendTimeOutError,
        );
      case DioExceptionType.connectionError:
        return Failure(
          ResponseCode.noInternetConnection,
          AppLocalizations.of(mContext).connectionError,
        );
      default:
        return Failure(
          ResponseCode.errorDefault,
          AppLocalizations.of(mContext).defaultError,
        );
    }
  }
}
