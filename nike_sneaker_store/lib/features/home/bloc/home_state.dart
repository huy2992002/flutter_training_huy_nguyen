import 'package:equatable/equatable.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/models/user_model.dart';

enum HomeViewStatus { initial, loading, success, failure }

enum HomeLoadMoreStatus {
  loadInitial,
  loading,
  loadSuccess,
  loadFailure,
  loadCompeted,
}

class HomeState extends Equatable {
  const HomeState({
    this.products = const [],
    this.productDisplays = const [],
    this.maxItem = 2,
    this.loadStatus = HomeLoadMoreStatus.loadInitial,
    this.user,
    this.categoryIndex = 0,
    this.homeStatus = HomeViewStatus.initial,
    this.errorMessage = '',
  });

  final List<ProductModel> products;
  final List<ProductModel> productDisplays;
  final int maxItem;
  final HomeLoadMoreStatus loadStatus;
  final UserModel? user;
  final int categoryIndex;
  final HomeViewStatus homeStatus;
  final String errorMessage;

  HomeState copyWith({
    List<ProductModel>? products,
    List<ProductModel>? productDisplays,
    UserModel? user,
    int? maxItem,
    HomeLoadMoreStatus? loadStatus,
    int? categoryIndex,
    HomeViewStatus? homeStatus,
    String? errorMessage,
  }) {
    return HomeState(
      products: products ?? this.products,
      productDisplays: productDisplays ?? this.productDisplays,
      maxItem: maxItem ?? this.maxItem,
      loadStatus: loadStatus ?? this.loadStatus,
      user: user ?? this.user,
      categoryIndex: categoryIndex ?? this.categoryIndex,
      homeStatus: homeStatus ?? this.homeStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        products,
        productDisplays,
        productDisplays.hashCode,
        maxItem,
        loadStatus,
        user,
        categoryIndex,
        homeStatus,
        errorMessage,
      ];
}
