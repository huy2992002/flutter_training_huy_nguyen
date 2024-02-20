import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';

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
