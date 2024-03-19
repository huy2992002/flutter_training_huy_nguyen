import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/components/dialog/ns_dialog.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/pages/cart/widgets/cart_information_item.dart';
import 'package:nike_sneaker_store/pages/cart/widgets/cart_total_cost.dart';
import 'package:nike_sneaker_store/pages/layout/layout_page.dart';
import 'package:nike_sneaker_store/services/local/shared_pref.dart';

class CartInformationPage extends StatefulWidget {
  const CartInformationPage({super.key});

  @override
  State<CartInformationPage> createState() => _CartInformationPageState();
}

class _CartInformationPageState extends State<CartInformationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  FocusNode _focusNodeEmail = FocusNode();
  FocusNode _focusNodePhone = FocusNode();
  FocusNode _addressNode = FocusNode();

  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() {
    UserModel? userLogin = SharedPrefs.userLogin;
    _emailController.text = userLogin?.email ?? '';
    _phoneController.text = userLogin?.phone ?? '';
    _addressController.text = userLogin?.address ?? '';
  }

  bool get _canCheckOut =>
      _emailController.text.isNotEmpty &&
      _phoneController.text.isNotEmpty &&
      _addressController.text.isNotEmpty;

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
          padding: const EdgeInsets.only(
            left: 20,
            top: 46,
            right: 20,
          ),
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
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                CartInformationItem(
                  controller: _emailController,
                  iconPath: Assets.icons.icEmail,
                  label: AppLocalizations.of(context).emailAddress,
                  onEdit: _focusNodeEmail.requestFocus,
                  onChanged: (_) {
                    setState(() {});
                  },
                  focusNode: _focusNodeEmail,
                ),
                const SizedBox(height: 16),
                CartInformationItem(
                  controller: _phoneController,
                  iconPath: Assets.icons.icPhone,
                  label: AppLocalizations.of(context).phone,
                  onEdit: _focusNodePhone.requestFocus,
                  onChanged: (_) {
                    setState(() {});
                  },
                  focusNode: _focusNodePhone,
                  keyboardType: TextInputType.phone,
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
                        onChanged: (_) {
                          setState(() {});
                        },
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          border: InputBorder.none,
                        ),
                        focusNode: _addressNode,
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
                  myCarts.clear();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LayoutPage(),
                      ),
                      (route) => false);
                },
              ),
            );
          },
          canCheckOut: _canCheckOut,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _addressNode.dispose();
    _focusNodeEmail.dispose();
    _focusNodePhone.dispose();
    super.dispose();
  }
}
