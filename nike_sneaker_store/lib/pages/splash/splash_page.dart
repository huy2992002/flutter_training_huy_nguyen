import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/pages/auth/sign_in_page.dart';
import 'package:nike_sneaker_store/pages/layout/layout_page.dart';
import 'package:nike_sneaker_store/pages/onboarding/onboarding_page.dart';
import 'package:nike_sneaker_store/services/local/shared_pref.dart';

class SplashPage extends StatefulWidget {
  /// Screen splash page
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _toPage();
    _changeBrightness();
  }

  void _changeBrightness() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          SharedPrefs.isDark ? Brightness.light : Brightness.dark,
    ));
  }

  /// After 2 seconds, it will switch to the [OnboardingPage]
  Future<void> _toPage() async {
    await Future.delayed(const Duration(milliseconds: 2300), () {});
    UserModel? userLogin = await SharedPrefs.getUserLogin();
    if (userLogin == null) {
      if (SharedPrefs.isAccessed) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInPage(),
          ),
          (route) => false,
        );
      } else {
        SharedPrefs.isAccessed = true;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingPage(),
          ),
          (route) => false,
        );
      }
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LayoutPage(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.scrim,
      body: Center(
        child: Image.asset(Assets.images.imgLogo.path),
      ),
    );
  }
}
