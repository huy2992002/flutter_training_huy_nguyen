import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/pages/cart/cart_page.dart';

class ActionIconAppBar extends StatelessWidget {
  /// Cart icon in AppBar with action to go to your cart
  const ActionIconAppBar({
    super.key,
    this.isMarked = false,
  });

  /// The [isMarked] argument is true will display marker 
  final bool isMarked;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NsIconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CartPage(),
            ),
          ),
          icon: SvgPicture.asset(
            Assets.icons.icBag,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        if (isMarked)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
