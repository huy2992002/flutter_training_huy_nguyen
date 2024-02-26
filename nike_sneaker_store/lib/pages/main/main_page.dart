import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nike_sneaker_store/pages/favorite/favorite_page.dart';
import 'package:nike_sneaker_store/pages/home/home_page.dart';
import 'package:nike_sneaker_store/pages/main/menu_page.dart';
import 'package:nike_sneaker_store/pages/main/widgets/ns_bottom_navigation_bar.dart';
import 'package:nike_sneaker_store/pages/main/widgets/ns_drawer.dart';
import 'package:nike_sneaker_store/pages/notification/notifications_page.dart';
import 'package:nike_sneaker_store/pages/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

ZoomDrawerController zoomController = ZoomDrawerController();
int currentPageIndex = 0;

class _MainPageState extends State<MainPage> {
  void _resetState() => setState(() {});

  List<Widget> _pages = [
    const HomePage(),
    const FavoritePage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  void changePage(int index) {
    currentPageIndex = index;
    _resetState();
  }

  @override
  Widget build(BuildContext context) {
    return NSDrawer(
      controller: zoomController,
      menuScreen: MenuPage(
        resetState: () => setState(() {}),
      ),
      mainScreen: Scaffold(
        body: _pages[currentPageIndex],
        bottomNavigationBar: NSBottomNavigationBar(
          currentIndex: currentPageIndex,
          onChangePage: changePage,
        ),
      ),
    );
  }
}
