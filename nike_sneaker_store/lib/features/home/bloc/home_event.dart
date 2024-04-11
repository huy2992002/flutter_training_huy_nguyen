abstract class HomeEvent {}

class HomeStarted extends HomeEvent {}

class HomeCategoryPressed extends HomeEvent {
  HomeCategoryPressed({required this.index, required this.type});

  final int index;
  final String type;
}
