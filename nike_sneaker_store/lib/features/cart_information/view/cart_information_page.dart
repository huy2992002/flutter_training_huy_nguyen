import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/components/dialog/ns_dialog.dart';
import 'package:nike_sneaker_store/components/snackbar/ns_snackbar.dart';
import 'package:nike_sneaker_store/features/cart/view/widgets/cart_information_item.dart';
import 'package:nike_sneaker_store/features/cart/view/widgets/cart_total_cost.dart';
import 'package:nike_sneaker_store/features/cart_information/bloc/cart_info_bloc.dart';
import 'package:nike_sneaker_store/features/cart_information/bloc/cart_info_event.dart';
import 'package:nike_sneaker_store/features/cart_information/bloc/cart_info_state.dart';
import 'package:nike_sneaker_store/features/profile/bloc/profile_bloc.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/routes/ns_routes_const.dart';
import 'package:nike_sneaker_store/services/remote/supabase_services.dart';

class CartInformationPage extends StatelessWidget {
  const CartInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _addressController = TextEditingController();
    FocusNode _focusNodeEmail = FocusNode();
    FocusNode _focusNodePhone = FocusNode();
    FocusNode _addressNode = FocusNode();

    _emailController.text = context
            .read<SupabaseServices>()
            .supabaseClient
            .auth
            .currentUser
            ?.email ??
        '';
    _phoneController.text = context.read<ProfileBloc>().state.user?.phone ?? '';
    _addressController.text =
        context.read<ProfileBloc>().state.user?.address ?? '';

    context.read<CartInfoBloc>().add(CartInfoStarted(
          context,
          email: _emailController.text,
          phoneNumber: _phoneController.text,
          address: _addressController.text,
        ));
    return BlocConsumer<CartInfoBloc, CartInfoState>(
      listener: (context, state) {
        if (state.status == CartCheckOutStatus.checkoutFailure) {
          NSSnackBar.snackbarError(context, title: state.message);
        }
        if (state.status == CartCheckOutStatus.checkoutSuccess) {
          NSDialog.textButton(
            context,
            title: AppLocalizations.of(context).yourPaymentSuccessful,
            textButton: AppLocalizations.of(context).backToShopping,
            icon: CircleAvatar(
                radius: 65,
                child: Image.asset(Assets.images.imgSuccessfully.path)),
            action: () {
              context.go(NSRoutesConst.pathHome);
            },
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: NSAppBar(
              title: AppLocalizations.of(context).myCart,
              leftIcon: NsIconButton(
                onPressed: () => context.pop(),
                icon: SvgPicture.asset(Assets.icons.icArrow),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 46,
                right: 20,
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context).contactInformation,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 16),
                    CartInformationItem(
                      controller: _emailController,
                      iconPath: Assets.icons.icEmail,
                      label: AppLocalizations.of(context).emailAddress,
                      onEdit: _focusNodeEmail.requestFocus,
                      focusNode: _focusNodeEmail,
                      onChanged: (value) => context
                          .read<CartInfoBloc>()
                          .add(CartInfoEmailChanged(context, email: value)),
                      readOnly:
                          state.status == CartCheckOutStatus.checkoutLoading,
                    ),
                    const SizedBox(height: 16),
                    CartInformationItem(
                      controller: _phoneController,
                      iconPath: Assets.icons.icPhone,
                      label: AppLocalizations.of(context).phone,
                      onEdit: _focusNodePhone.requestFocus,
                      focusNode: _focusNodePhone,
                      keyboardType: TextInputType.phone,
                      readOnly:
                          state.status == CartCheckOutStatus.checkoutLoading,
                      onChanged: (value) => context.read<CartInfoBloc>().add(
                          CartInfoPhoneChanged(context, phoneNumber: value)),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      AppLocalizations.of(context).address,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _addressController,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                            onChanged: (value) => context
                                .read<CartInfoBloc>()
                                .add(CartInfoAddressChanged(context,
                                    address: value)),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                              border: InputBorder.none,
                            ),
                            focusNode: _addressNode,
                            readOnly: state.status ==
                                CartCheckOutStatus.checkoutLoading,
                          ),
                        ),
                        GestureDetector(
                          onTap: _addressNode.requestFocus,
                          child: SvgPicture.asset(Assets.icons.icEdit),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: CartTotalCost(
              onCheckout: () => context.read<CartInfoBloc>().add(
                    CartInfoCheckoutPressed(),
                  ),
              canCheckOut: state.canAction,
              isDisable: state.status == CartCheckOutStatus.checkoutLoading,
            ),
          ),
        );
      },
    );
  }
}
