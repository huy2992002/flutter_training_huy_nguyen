import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/components/app_bar/action_icon_app_bar.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/avatar/ns_image_network.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/constants/ns_constants.dart';
import 'package:nike_sneaker_store/features/detail/bloc/detail_bloc.dart';
import 'package:nike_sneaker_store/features/detail/bloc/detail_event.dart';
import 'package:nike_sneaker_store/features/detail/bloc/detail_state.dart';
import 'package:nike_sneaker_store/features/detail/view/widgets/ns_read_more.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';
import 'package:nike_sneaker_store/utils/extension.dart';

class DetailPage extends StatelessWidget {
  /// Screen display detail of [ProductModel]

  const DetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: NSAppBar(
          leftIcon: NsIconButton(
            onPressed: () => Navigator.pop(context),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            icon: SvgPicture.asset(
              Assets.icons.icArrow,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          title: 'Details',
          rightIcon: ActionIconAppBar(
            isMarked: myCarts.isNotEmpty,
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(
            left: 20,
            top: 26,
            right: 20,
          ),
          children: [
            Text(
              state.productDisplay?.name ?? '',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              state.productDisplay?.category ?? '',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              state.productDisplay?.price?.toPriceDollar() ?? '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Hero(
                tag: NSConstants.tagProductDetail(
                    state.productDisplay?.uuid ?? ''),
                child: NSImageNetwork(
                  path: state.productDisplay?.imagePath,
                  height: 120,
                  width: 200,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    state.products.length > 5 ? 5 : state.products.length,
                    (index) {
                  final productImage = state.products[index];
                  return GestureDetector(
                    onTap: () => context.read<DetailBloc>().add(
                          DetailChangeProductPressed(product: productImage),
                        ),
                    child: Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.only(right: 14),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          border: state.productDisplay?.uuid ==
                                  productImage.uuid
                              ? Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              : null,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: NSImageNetwork(
                          path: productImage.imagePath,
                          width: 56,
                          height: 56,
                        )),
                  );
                }),
              ),
            ),
            const SizedBox(height: 30),
            NSReadMore(text: state.productDisplay?.description ?? '')
          ],
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 27).copyWith(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: CircleAvatar(
                  radius: 26,
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  child: SvgPicture.asset(
                    state.productDisplay?.isFavorite ?? false
                        ? Assets.icons.icHeart
                        : Assets.icons.icHeartOutline,
                    width: 26,
                    height: 26,
                    color: state.productDisplay?.isFavorite ?? false
                        ? NSColor.favorite
                        : Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              NSElevatedButton.icon(
                icon: SvgPicture.asset(
                  Assets.icons.icBag,
                  width: 26,
                  height: 26,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 13),
                text: AppLocalizations.of(context).addToCart,
              )
            ],
          ),
        ),
      );
    });
  }
}
