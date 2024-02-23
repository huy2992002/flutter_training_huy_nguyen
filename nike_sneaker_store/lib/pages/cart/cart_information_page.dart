import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/components/dialog/ns_dialog.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/pages/cart/widgets/cart_information_item.dart';
import 'package:nike_sneaker_store/pages/cart/widgets/cart_total_cost.dart';
import 'package:nike_sneaker_store/pages/main/main_page.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class CartInformationPage extends StatefulWidget {
  const CartInformationPage({super.key});

  @override
  State<CartInformationPage> createState() => _CartInformationPageState();
}

class _CartInformationPageState extends State<CartInformationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodePhone = FocusNode();
  FocusNode addressNode = FocusNode();

  @override
  void initState() {
    emailController.text = userLogin?.email ?? '';
    phoneController.text = userLogin?.phone ?? '';
    addressController.text = userLogin?.address ?? '';
    super.initState();
  }

  bool get canCheckOut =>
      emailController.text.isNotEmpty &&
      phoneController.text.isNotEmpty &&
      addressController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: NSAppBar(
          title: AppLocalizations.of(context).myCart,
          leftIcon: NsIconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(Assets.icons.icArrow),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 46),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context).contactInformation,
                  style: NSStyle.h14Medium,
                ),
                const SizedBox(height: 16),
                CartInformationItem(
                  controller: emailController,
                  iconPath: Assets.icons.icEmail,
                  label: AppLocalizations.of(context).emailAddress,
                  onEdit: focusNodeEmail.requestFocus,
                  onChanged: (_) {
                    setState(() {});
                  },
                  focusNode: focusNodeEmail,
                ),
                const SizedBox(height: 16),
                CartInformationItem(
                  controller: phoneController,
                  iconPath: Assets.icons.icPhone,
                  label: AppLocalizations.of(context).emailAddress,
                  onEdit: focusNodePhone.requestFocus,
                  onChanged: (_) {
                    setState(() {});
                  },
                  focusNode: focusNodePhone,
                ),
                const SizedBox(height: 12),
                Text(
                  AppLocalizations.of(context).address,
                  style: NSStyle.h14Medium,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: addressController,
                        onChanged: (_) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          border: InputBorder.none,
                        ),
                        focusNode: addressNode,
                      ),
                    ),
                    GestureDetector(
                      onTap: addressNode.requestFocus,
                      child: SvgPicture.asset(Assets.icons.icEdit),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CartTotalCost(
          onCheckout: () {
            NSDialog.textButton(
              context,
              title: AppLocalizations.of(context).yourPaymentSuccessful,
              textButton: AppLocalizations.of(context).backToShopping,
              icon: CircleAvatar(
                  radius: 65,
                  child: Image.asset(Assets.images.imgSuccessfully.path)),
              action: () => WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                      (route) => false);
                },
              ),
            );
          },
          canCheckOut: canCheckOut,
        ),
      ),
    );
  }
}
