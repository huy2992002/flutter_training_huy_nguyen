import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/pages/favorite/favorite_page.dart';
import 'package:nike_sneaker_store/pages/home/home_page.dart';
import 'package:nike_sneaker_store/pages/layout/menu_page.dart';
import 'package:nike_sneaker_store/pages/layout/widgets/ns_bottom_navigation_bar.dart';
import 'package:nike_sneaker_store/pages/layout/widgets/ns_drawer.dart';
import 'package:nike_sneaker_store/pages/notification/notifications_page.dart';
import 'package:nike_sneaker_store/pages/profile/profile_page.dart';
import 'package:nike_sneaker_store/services/local/shared_pref.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

/// The [ZoomDrawerController] of [TextFormField] drawer
ZoomDrawerController zoomController = ZoomDrawerController();

/// index of [LayoutPage]
int currentPageIndex = 0;

class _LayoutPageState extends State<LayoutPage> {
  /// [List] page display [BottomNavigationBar]
  List<Widget> _pages = [
    const HomePage(),
    const FavoritePage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];
  UserModel? userLogin;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  /// The function changed page with index
  void changedPage(int index) {
    currentPageIndex = index;
    setState(() {});
  }

  void getUser() {
    userLogin = SharedPrefs.userLogin;
  }

  @override
  Widget build(BuildContext context) {
    return NSDrawer(
      controller: zoomController,
      menuScreen: MenuPage(
        resetState: () => setState(() {}),
        name: userLogin?.name,
      ),
      mainScreen: Scaffold(
        body: _pages[currentPageIndex],
        bottomNavigationBar: NSBottomNavigationBar(
          currentIndex: currentPageIndex,
          onChangedPage: changedPage,
        ),
      ),
    );
  }
}
