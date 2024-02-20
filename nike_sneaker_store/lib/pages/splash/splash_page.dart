import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/pages/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    toPage();
  }

  Future<void> toPage() async {
    await Future.delayed(const Duration(milliseconds: 2300), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingPage(),
        ),
      );
    });
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
