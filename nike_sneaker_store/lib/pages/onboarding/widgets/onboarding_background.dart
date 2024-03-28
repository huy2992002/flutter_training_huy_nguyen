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
              Center(
                child: Image.asset(
                  Assets.images.imgLogoNike.path,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}
