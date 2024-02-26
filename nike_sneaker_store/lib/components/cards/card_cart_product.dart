import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/utils/extension.dart';

class CardCartProduct extends StatefulWidget {
  const CardCartProduct({
    required this.product,
    this.onTap,
    this.onPlus,
    this.onLess,
    this.onRemove,
    super.key,
  });

  final ProductModel product;
  final Function()? onTap;
  final Function()? onPlus;
  final Function()? onLess;
  final Function()? onRemove;

  @override
  State<CardCartProduct> createState() => _CardCartProductState();
}

class _CardCartProductState extends State<CardCartProduct> {
  bool isShowDelete = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
        setState(() {
          isShowDelete = false;
        });
      },
      onLongPress: () {
        setState(() {
          isShowDelete = true;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 85,
              height: 85,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(widget.product.imagePath),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  Text(
                    widget.product.price.toPriceDollar(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ],
              ),
            ),
            if (isShowDelete)
              GestureDetector(
                onTap: () {
                  widget.onRemove?.call();
                  setState(() {
                    isShowDelete = false;
                  });
                },
                child: Container(
                  width: 50,
                  height: 85,
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SvgPicture.asset(
                    Assets.icons.icTrash,
                    color: Theme.of(context).colorScheme.onError,
                  ),
                ),
              )
            else
              Row(
                children: [
                  iconButton(
                    context,
                    iconPath: Assets.icons.icAdd,
                    onTap: widget.onPlus,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '${widget.product.quantity}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                  ),
                  iconButton(
                    context,
                    iconPath: Assets.icons.icRemove,
                    onTap: widget.onLess,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget iconButton(
    BuildContext context, {
    required String iconPath,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        iconPath,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
