import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_bloc.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_state.dart';
import 'package:nike_sneaker_store/features/layout/bloc/layout_cubit.dart';
import 'package:nike_sneaker_store/features/layout/view/menu_page.dart';
import 'package:nike_sneaker_store/features/layout/view/widgets/ns_bottom_navigation_bar.dart';
import 'package:nike_sneaker_store/features/layout/view/widgets/ns_drawer.dart';
import 'package:nike_sneaker_store/features/notification/bloc/notification_bloc.dart';
import 'package:nike_sneaker_store/features/notification/bloc/notification_event.dart';
import 'package:nike_sneaker_store/features/profile/bloc/profile_bloc.dart';
import 'package:nike_sneaker_store/features/profile/bloc/profile_event.dart';
import 'package:nike_sneaker_store/repository/product_repository.dart';
import 'package:nike_sneaker_store/repository/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    void goBrach(int index) {
      navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider<NotificationBloc>(
          create: (context) => NotificationBloc(
            context.read<ProductRepository>(),
            context.read<UserRepository>(),
          )..add(NotificationStarted(
              userId: Supabase.instance.client.auth.currentUser?.id ?? '',
            )),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(context.read<UserRepository>())
            ..add(ProfileStarted(
              name: context.read<HomeBloc>().state.user?.name,
              address: context.read<HomeBloc>().state.user?.address,
              phoneNumber: context.read<HomeBloc>().state.user?.phone,
              avatar: context.read<HomeBloc>().state.user?.avatar,
            )),
        ),
      ],
      child: BlocSelector<LayoutCubit, int, int>(
        selector: (state) => state,
        builder: (context, state) {
          return NSDrawer(
            controller: context.read<ZoomDrawerController>(),
            menuScreen: const MenuPage(),
            mainScreen: Scaffold(
                body: navigationShell,
                bottomNavigationBar:
                    BlocSelector<HomeBloc, HomeState, HomeViewStatus>(
                  selector: (state) => state.homeStatus,
                  builder: (context, homeStatus) {
                    return NSBottomNavigationBar(
                      currentIndex: state,
                      onChangedPage: homeStatus == HomeViewStatus.loading
                          ? null
                          : (index) {
                              context.read<LayoutCubit>().onChangePage(index);
                              goBrach(index);
                            },
                    );
                  },
                )),
          );
        },
      ),
    );
  }
}
