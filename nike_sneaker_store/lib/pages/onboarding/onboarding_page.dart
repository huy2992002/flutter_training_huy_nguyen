import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/pages/auth/sign_in_page.dart';
import 'package:nike_sneaker_store/pages/onboarding/bloc/onboarding_cubit.dart';
import 'package:nike_sneaker_store/pages/onboarding/widgets/onboarding_background.dart';
import 'package:nike_sneaker_store/pages/onboarding/widgets/onboarding_power.dart';
import 'package:nike_sneaker_store/pages/onboarding/widgets/onboarding_start.dart';
import 'package:nike_sneaker_store/pages/onboarding/widgets/onboarding_welcome.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// controller of [PageView]
    final PageController _pageController = PageController();

    /// List page display [PageView]
    List<Widget> _onboardPages = [
      const OnboardingWelcome(),
      const OnboardingStart(),
      const OnboardingPower(),
    ];

    /// The function to switch page of [PageView].
    /// If it is on the last page, it will switch to [SignInPage]
    void _onNext(int pageIndex) {
      if (pageIndex < _onboardPages.length - 1) {
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

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: BlocProvider(
        create: (context) => OnboardingCubit(),
        child: BlocSelector<OnboardingCubit, int, int>(
          selector: (state) => state,
          builder: (context, state) {
            return Stack(
              children: [
                BackgroundOnboarding(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _onboardPages.length,
                    itemBuilder: (_, index) => _onboardPages[index],
                    onPageChanged: (value) {
                      context.read<OnboardingCubit>().onChangePage(value);
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
                            width: state == index ? 42 : 28,
                            height: 5,
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              color: state == index
                                  ? Theme.of(context).colorScheme.onSecondary
                                  : Theme.of(context).colorScheme.tertiary,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      NSElevatedButton.text(
                        onPressed: () => _onNext(state),
                        backgroundColor: NSColor.background,
                        textColor: NSColor.onBackground,
                        text: state == 0
                            ? AppLocalizations.of(context).getStarted
                            : AppLocalizations.of(context).next,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
