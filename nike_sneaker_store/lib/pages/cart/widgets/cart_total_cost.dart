import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/pages/cart/widgets/cart_value_item.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';
import 'package:nike_sneaker_store/utils/extension.dart';

class CartTotalCost extends StatelessWidget {
  const CartTotalCost({
    required this.onCheckout,
    super.key,
    this.canCheckOut = false,
  });

  final Function() onCheckout;
  final bool canCheckOut;

  @override
  Widget build(BuildContext context) {
    double subTotal() {
      double subTotal = 0;
      for (ProductModel pr in myCarts) {
        subTotal += pr.price * pr.quantity;
      }
      return subTotal;
    }

    double delivery() {
      if (subTotal() == 0.0) {
        return 0;
      } else {
        return 60;
      }
    }

    double totalCost = subTotal() + delivery();
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CartValueItem(
            title: AppLocalizations.of(context).subTotal,
            value: subTotal().toPriceDollar(),
          ),
          const SizedBox(height: 10),
          CartValueItem(
            title: AppLocalizations.of(context).delivery,
            value: delivery().toPriceDollar(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: DottedLine(
              dashColor: NSColor.neutral,
            ),
          ),
          Row(
            children: [
              Text(
                AppLocalizations.of(context).totalCost,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: NSColor.neutral,
                    ),
              ),
              const Spacer(),
              Text(
                totalCost.toPriceDollar(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: 'Poppins',
                    ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          NSElevatedButton.text(
            onPressed: () {
              if (!canCheckOut) return;
              onCheckout.call();
            },
            text: AppLocalizations.of(context).checkOut,
            backgroundColor: !canCheckOut
                ? NSColor.neutral
                : Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
