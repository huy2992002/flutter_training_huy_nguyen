import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _pageIndex = 0;
  final PageController _pageController = PageController();

  List<Widget> onboardPages = [
    const Onboarding1(),
    const Onboarding2(),
    const Onboarding3(),
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

class Onboarding3 extends StatelessWidget {
  const Onboarding3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Column(
        children: [
          Image.asset(Assets.images.imgPrOnboard3.path),
          const SizedBox(height: 50),
          Text(
            AppLocalizations.of(context).youHavePowerTo,
            style: NSStyle.h32Bold
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            AppLocalizations.of(context).thereAreManyBeautifulAttractive,
            style: NSStyle.h16Normal.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Onboarding2 extends StatelessWidget {
  const Onboarding2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Column(
        children: [
          Image.asset(Assets.images.imgPrOnboard2.path),
          const SizedBox(height: 50),
          Text(
            AppLocalizations.of(context).letStartJourney,
            style: NSStyle.h32Bold
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            AppLocalizations.of(context).smartGorgeousFashionable,
            style: NSStyle.h16Normal.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Onboarding1 extends StatelessWidget {
  const Onboarding1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context).welcomeTo.toUpperCase(),
            style: NSStyle.h32Black.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Image.asset(Assets.images.imgPrOnboard1.path)
        ],
      ),
    );
  }
}

class BackgroundOnboarding extends StatelessWidget {
  const BackgroundOnboarding({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Assets.images.imgSplashHightLight.path),
              const SizedBox(height: 200),
              Image.asset(
                Assets.images.imgLogoNike.path,
                width: size.width,
              )
            ],
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}
