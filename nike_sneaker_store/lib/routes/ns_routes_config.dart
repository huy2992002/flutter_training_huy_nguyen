import 'package:go_router/go_router.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/view/sign_in_page.dart';
import 'package:nike_sneaker_store/features/onboarding/view/onboarding_page.dart';
import 'package:nike_sneaker_store/pages/auth/forgot_password_page.dart';
import 'package:nike_sneaker_store/pages/auth/sign_up_page.dart';
import 'package:nike_sneaker_store/pages/auth/verification_page.dart';
import 'package:nike_sneaker_store/pages/cart/cart_information_page.dart';
import 'package:nike_sneaker_store/pages/cart/cart_page.dart';
import 'package:nike_sneaker_store/pages/layout/layout_page.dart';
import 'package:nike_sneaker_store/pages/splash/splash_page.dart';
import 'package:nike_sneaker_store/routes/ns_routes_const.dart';

class NSRoutesConfig {
  static GoRouter goRoute = GoRouter(
    initialLocation: NSRoutesConst.pathSplash,
    routes: [
      GoRoute(
        name: NSRoutesConst.nameSplash,
        path: NSRoutesConst.pathSplash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: NSRoutesConst.nameOnboarding,
        path: NSRoutesConst.pathOnboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        name: NSRoutesConst.nameSignIn,
        path: NSRoutesConst.pathSignIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        name: NSRoutesConst.nameSignUp,
        path: NSRoutesConst.pathSignUp,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        name: NSRoutesConst.nameForgotPass,
        path: NSRoutesConst.pathForgotPass,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        name: NSRoutesConst.nameVerification,
        path: NSRoutesConst.pathVerification,
        builder: (context, state) => const VerificationPage(),
      ),
      GoRoute(
        name: NSRoutesConst.nameLayout,
        path: NSRoutesConst.pathLayout,
        builder: (context, state) => const LayoutPage(),
      ),
      GoRoute(
        name: NSRoutesConst.nameCart,
        path: NSRoutesConst.pathCart,
        builder: (context, state) => const CartPage(),
      ),
      GoRoute(
        name: NSRoutesConst.nameCartInfo,
        path: NSRoutesConst.pathCartInfo,
        builder: (context, state) => const CartInformationPage(),
      ),
    ],
  );
}
