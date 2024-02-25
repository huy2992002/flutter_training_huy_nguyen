import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/pages/favorite/favorite_page.dart';
import 'package:nike_sneaker_store/pages/home/home_page.dart';
import 'package:nike_sneaker_store/pages/main/widgets/ns_bottom_navigation_bar.dart';
import 'package:nike_sneaker_store/pages/notification/notifications_page.dart';
import 'package:nike_sneaker_store/pages/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    const HomePage(),
    const FavoritePage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  void changePage(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NSBottomNavigationBar(
        currentIndex: _currentIndex,
        onChangePage: changePage,
      ),
    );
  }
}
