import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_bloc.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_event.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_state.dart';
import 'package:nike_sneaker_store/repository/product_repository.dart';
import 'package:nike_sneaker_store/repository/user_repository.dart';
import 'package:nike_sneaker_store/utils/enum.dart';

import '../../repository/mock_product_repository.dart';
import '../../repository/mock_user_repository.dart';
import '../../utils/mock_data.dart';

void main() {
  late ProductRepository productRepository;
  late UserRepository userRepository;

  late HomeBloc homeBloc;

  setUp(() {
    productRepository = MockProductRepository();
    userRepository = MockUserRepository();
    homeBloc = HomeBloc(
      productRepository,
      userRepository,
    );
  });

  group('Home Bloc Test', () {
    test('initial state is HomeState', () {
      expect(homeBloc.state, equals(const HomeState()));
    });

    blocTest(
      'emit status loading & emit data when fetch success',
      build: () => homeBloc,
      act: (bloc) {
        bloc.add(
            HomeStarted(userId: 'userId'));
      },
      expect: () => [
        const HomeState(homeStatus: HomeViewStatus.loading),
        HomeState(
          products: MockData.mockProducts,
          productDisplays: MockData.mockProducts,
          user: MockData.mockUser,
          homeStatus: HomeViewStatus.success,
        ),
      ],
    );

    blocTest(
      'emit status loading & emit message error when fetch failure',
      build: () => homeBloc,
      act: (bloc) {
        bloc.add(
            HomeStarted(userId: ''));
      },
      expect: () => [
        const HomeState(homeStatus: HomeViewStatus.loading),
        const HomeState(
          homeStatus: HomeViewStatus.failure,
          errorMessage: 'Exception: An error occurred, please check UserId'
        ),
      ],
    );

    blocTest(
      'emit an empty product list when there is no duplicate category and emit when changing the category',
      build: () => homeBloc,
      seed: () => HomeState(
        products: MockData.mockProducts,
        productDisplays: MockData.mockProducts,
      ),
      act: (bloc) {
        bloc
          ..add(HomeCategoryPressed(index: 1, type: CategoryType.outDoor.name))
          ..add(
              HomeCategoryPressed(index: 0, type: CategoryType.allShoes.name));
      },
      expect: () => [
        HomeState(products: MockData.mockProducts, categoryIndex: 1),
        HomeState(
          products: MockData.mockProducts,
          productDisplays: MockData.mockProducts,
        ),
      ],
    );
  });
}
