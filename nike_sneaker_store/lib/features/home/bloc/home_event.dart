import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class HomeStarted extends HomeEvent {
  HomeStarted({required this.userId});
  final String userId;

  @override
  List<Object?> get props => [userId];
}

class HomeLoadMore extends HomeEvent {
  HomeLoadMore({required this.types});
  final List<String> types;
  @override
  List<Object?> get props => [types];
}

class HomeCategoryPressed extends HomeEvent {
  HomeCategoryPressed({required this.index, required this.type});

  final int index;
  final String type;

  @override
  List<Object?> get props => [index, type];
}

class HomeFavoritePressed extends HomeEvent {
  HomeFavoritePressed({
    required this.userId,
    this.productId,
  });

  final String userId;
  final String? productId;

  @override
  List<Object?> get props => [userId, productId];
}

class HomeFavoriteRemove extends HomeEvent {
  HomeFavoriteRemove({
    required this.productId,
  });

  final String productId;

  @override
  List<Object?> get props => [productId];
}
