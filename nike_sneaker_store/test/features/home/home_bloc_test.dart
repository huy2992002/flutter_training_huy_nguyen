import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_bloc.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_event.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_state.dart';
import 'package:nike_sneaker_store/repository/auth_repository.dart';
import 'package:nike_sneaker_store/repository/product_repository.dart';
import 'package:nike_sneaker_store/repository/user_repository.dart';
import 'package:nike_sneaker_store/utils/enum.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../repository/mock_auth_repository.dart';
import '../../repository/mock_product_repository.dart';
import '../../repository/mock_user_repository.dart';
import '../../utils/mock_data.dart';
import '../../utils/mock_supabase.dart';

void main() {
  late AuthRepository authRepository;
  late ProductRepository productRepository;
  late UserRepository userRepository;

  late HomeBloc homeBloc;
  late SupabaseClient supabaseClient;

  setUp(() {
    authRepository = MockAuthRepository();
    productRepository = MockProductRepository();
    userRepository = MockUserRepository();
    homeBloc = HomeBloc(
      productRepository,
      authRepository,
      userRepository,
    );
    supabaseClient = MockSupabase();
  });

  group('Home Bloc Test', () {
    test('initial state is SignUpState', () {
      expect(homeBloc.state, equals(const HomeState()));
    });

    blocTest(
      'emit status loading & emit data when fetch success',
      build: () => homeBloc,
      act: (bloc) {
        bloc.add(
            HomeStarted(userId: supabaseClient.auth.currentUser?.id ?? ''));
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
