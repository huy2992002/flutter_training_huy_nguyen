import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/notification/bloc/notification_event.dart';
import 'package:nike_sneaker_store/features/notification/bloc/notification_state.dart';
import 'package:nike_sneaker_store/models/notification_model.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/repository/product_repository.dart';
import 'package:nike_sneaker_store/repository/user_repository.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(this.productRepository, this.userRepository)
      : super(const NotificationState()) {
    on<NotificationStarted>(_onStarted);
    on<NotificationReadPressed>(_onReadNotification);
    on<NotificationRemoveAllPressed>(_onRemoveAll);
  }

  final ProductRepository productRepository;
  final UserRepository userRepository;

  Future<void> _onStarted(
      NotificationStarted event, Emitter<NotificationState> emit) async {
    emit(state.copyWith(status: NotificationViewStatus.loading));
    try {
      final notifications =
          await productRepository.fetchNotifications(event.userId);
      emit(state.copyWith(
        status: NotificationViewStatus.success,
        notifications: notifications,
      ));
    } catch (e) {
      String? message;

      e is DioException ? message = e.message : message = e.toString();
      emit(state.copyWith(
        status: NotificationViewStatus.failure,
        message: message,
      ));
    }
  }

  Future<void> _onReadNotification(
      NotificationReadPressed event, Emitter<NotificationState> emit) async {
    emit(state.copyWith(itemStatus: ListNotificationStatus.readLoading));
    try {
      final notifications = [...state.notifications];
      for (NotificationModel element in notifications) {
        if (element.uuid == event.notificationId) {
          element.isRead = true;
        }
      }
      emit(state.copyWith(
        notifications: notifications,
        itemStatus: ListNotificationStatus.readSuccess,
      ));
      userRepository.updateInformationUser(UserModel(
        uuid: event.userId,
        notifications: notifications,
      ));
    } catch (e) {
      String? message;

      e is DioException ? message = e.message : message = e.toString();
      emit(state.copyWith(
        itemStatus: ListNotificationStatus.readFailure,
        message: message,
      ));
    }
  }

  Future<void> _onRemoveAll(NotificationRemoveAllPressed event,
      Emitter<NotificationState> emit) async {
    emit(state.copyWith(itemStatus: ListNotificationStatus.removeLoading));

    try {
      emit(state.copyWith(
        itemStatus: ListNotificationStatus.removeSuccess,
        notifications: [],
      ));
      userRepository.updateInformationUser(UserModel(
        uuid: event.userId,
        notifications: [],
      ));
    } catch (e) {
      String? message;

      e is DioException ? message = e.message : message = e.toString();
      emit(state.copyWith(
        itemStatus: ListNotificationStatus.removeFailure,
        message: message,
      ));
    }
  }
}
