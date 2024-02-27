import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/pages/auth/sign_in_page.dart';
import 'package:nike_sneaker_store/pages/onboarding/widgets/onboarding_background.dart';
import 'package:nike_sneaker_store/pages/onboarding/widgets/onboarding_power.dart';
import 'package:nike_sneaker_store/pages/onboarding/widgets/onboarding_start.dart';
import 'package:nike_sneaker_store/pages/onboarding/widgets/onboarding_welcome.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _pageIndex = 0;
  final PageController _pageController = PageController();

  List<Widget> _onboardPages = [
    const OnboardingWelcome(),
    const OnboardingStart(),
    const OnboardingPower(),
  ];

  void _resetState() => setState(() {});

  void _onNext() {
    if (_pageIndex < _onboardPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(microseconds: 200),
        curve: Curves.bounceIn,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const SignInPage(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Stack(
        children: [
          BackgroundOnboarding(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardPages.length,
              itemBuilder: (_, index) => _onboardPages[index],
              onPageChanged: (value) {
                _pageIndex = value;
                _resetState();
              },
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 26,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onboardPages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: _pageIndex == index ? 42 : 28,
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: _pageIndex == index
                            ? Theme.of(context).colorScheme.onSecondary
                            : Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                NSElevatedButton.text(
                  onPressed: _onNext,
                  backgroundColor: NSColor.background,
                  textColor: NSColor.onBackground,
                  text: _pageIndex == 0
                      ? AppLocalizations.of(context).getStarted
                      : AppLocalizations.of(context).next,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
