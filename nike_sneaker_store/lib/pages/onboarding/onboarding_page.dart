import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
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

  List<Widget> onboardPages = [
    const OnboardingWelcome(),
    const OnboardingStart(),
    const OnboardingPower(),
  ];

  void onNext() {
    if (_pageIndex < onboardPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(microseconds: 200),
        curve: Curves.bounceIn,
      );
    } else {}
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
              itemCount: onboardPages.length,
              itemBuilder: (context, index) => onboardPages[index],
              onPageChanged: (value) {
                _pageIndex = value;
                setState(() {});
              },
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 36,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardPages.length,
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
                const SizedBox(height: 60),
                NSElevatedButton.text(
                  onPressed: onNext,
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
