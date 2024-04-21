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

    return BlocSelector<LayoutCubit, int, int>(
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
    );
  }
}
