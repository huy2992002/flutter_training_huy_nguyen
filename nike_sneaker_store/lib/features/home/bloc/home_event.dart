abstract class HomeEvent {}

class HomeStarted extends HomeEvent {
  HomeStarted({required this.userId});
  final String userId;
}

class HomeCategoryPressed extends HomeEvent {
  HomeCategoryPressed({required this.index, required this.type});

  final int index;
  final String type;
}

class HomeFavoritePressed extends HomeEvent {
  HomeFavoritePressed({
    required this.indexProduct,
  });

  final int indexProduct;
}

class HomeFavoriteRemove extends HomeEvent {
  HomeFavoriteRemove({
    required this.productId,
  });

  final String productId;
}
