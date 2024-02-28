import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nike_sneaker_store/components/app_bar/action_icon_app_bar.dart';
import 'package:nike_sneaker_store/components/app_bar/app_bar_home.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/avatar/ns_avatar.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/components/cards/card_cart_product.dart';
import 'package:nike_sneaker_store/components/cards/card_category.dart';
import 'package:nike_sneaker_store/components/cards/card_notification.dart';
import 'package:nike_sneaker_store/components/cards/card_sale.dart';
import 'package:nike_sneaker_store/components/otp/ns_otp_code.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_text_form_field.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/notification_model.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/themes/ns_theme.dart';
import 'package:nike_sneaker_store/widgetbook/widgetbook.directories.g.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetBookApp());
}

@widgetbook.App()
class WidgetBookApp extends StatelessWidget {
  const WidgetBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        DeviceFrameAddon(
          initialDevice: Devices.ios.iPhone13,
          devices: [
            NoneDevice.instance,
            Devices.ios.iPhone13,
            Devices.android.samsungGalaxyA50,
            Devices.ios.iPad12InchesGen2,
          ],
        ),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: NSTheme.lightTheme,
            ),
            WidgetbookTheme(
              name: 'Dart',
              data: NSTheme.darkTheme,
            ),
          ],
          initialTheme: WidgetbookTheme(
            name: 'Dart',
            data: NSTheme.darkTheme,
          ),
        ),
        LocalizationAddon(
          locales: [
            ...AppLocalizations.supportedLocales,
            const Locale('en', 'vn'),
          ],
          localizationsDelegates: AppLocalizations.localizationsDelegates,
        ),
        AlignmentAddon(),
      ],
    );
  }
}

@widgetbook.UseCase(
  name: 'Button',
  type: NSElevatedButton,
)
Widget elevatedButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NSElevatedButton.text(
          onPressed: () {},
          text: context.knobs.string(
            label: 'Content NSElevatedButton.text',
            initialValue: 'Login',
          ),
        ),
        const SizedBox(height: 30),
        NSElevatedButton.icon(
          onPressed: () {},
          icon: SvgPicture.asset(
            Assets.icons.icBag,
            height: 20,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          text: context.knobs.string(
            label: 'Content NSElevatedButton.icon',
            initialValue: 'Add To Cart',
          ),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Button',
  type: NsIconButton,
)
Widget iconButton(BuildContext context) {
  return NsIconButton(
    onPressed: () {},
    icon: SvgPicture.asset(
      Assets.icons.icArrow,
      color: Theme.of(context).colorScheme.onPrimaryContainer,
    ),
    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
  );
}

@widgetbook.UseCase(
  name: 'AppBar',
  type: AppBarHome,
)
Widget appBarHome(BuildContext context) {
  return Align(
    alignment: Alignment.topCenter,
    child: AppBarHome(
      onMenu: () {},
      isMarkerNotification: context.knobs.boolean(label: 'Marker'),
    ),
  );
}

@widgetbook.UseCase(
  name: 'AppBar',
  type: NSAppBar,
)
Widget nsAppBar(BuildContext context) {
  return Align(
    alignment: Alignment.topCenter,
    child: NSAppBar(
      title: context.knobs.string(
        label: 'Title',
        initialValue: 'Title App Bar',
      ),
      leftIcon: NsIconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          Assets.icons.icArrow,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      rightIcon: ActionIconAppBar(
        isMarked: context.knobs.boolean(label: 'Marker'),
      ),
      colorAppBar: Theme.of(context).colorScheme.background,
    ),
  );
}

@widgetbook.UseCase(
  name: 'TextField',
  type: NSTextFormField,
)
Widget nsTextFormField(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const NSTextFormField.text(
            hintText: 'Email',
          ),
          const SizedBox(height: 20),
          NSTextFormField.password(
            hintText: 'Password',
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Avatar',
  type: NSAvatar,
)
Widget nsAvatar(BuildContext context) {
  return NSAvatar(imagePath: Assets.images.imgAvatar.path);
}

@widgetbook.UseCase(
  name: 'OTP',
  type: NSOtpCode,
)
Widget nsOTPCode(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    body: Center(
      child: NSOtpCode(
        codeLength: context.knobs.int.slider(
          label: 'Length OTP',
          initialValue: 4,
          min: 1,
          max: 5,
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Cards',
  type: CardCartProduct,
)
Widget cardCartProduct(BuildContext context) {
  ProductModel product = ProductModel(
    uuid: 'uuid',
    name: context.knobs.string(
      label: 'Product name',
      initialValue: 'Product 1',
    ),
    imagePath: Assets.images.imgNikeAirMax.path,
    price:
        context.knobs.double.input(label: 'Product price', initialValue: 200),
    quantity: context.knobs.int.slider(
      label: 'Quantity product',
      initialValue: 20,
      min: 1,
      max: 50,
    ),
    description: 'description',
    isBestSeller: false,
    category: 'category',
  );
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardCartProduct(product: product),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Cards',
  type: CardCategory,
)
Widget cardCategory(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CardCategory(
        text: 'All Shoes',
        backgroundColor: Theme.of(context).colorScheme.primary,
        textColor: Theme.of(context).colorScheme.onPrimary,
      ),
      const SizedBox(width: 20),
      const CardCategory(text: 'Tennis'),
    ],
  );
}

@widgetbook.UseCase(
  name: 'Cards',
  type: CardNotification,
)
Widget cardNotification(BuildContext context) {
  ProductModel product = ProductModel(
    uuid: 'uuid',
    name: 'name product',
    imagePath: Assets.images.imgNikeAirMax.path,
    price: 200,
    quantity: context.knobs.int.slider(
      label: 'Quantity product',
      initialValue: 20,
      min: 1,
      max: 50,
    ),
    description: 'description',
    isBestSeller: false,
    category: 'category',
  );

  NotificationModel notification = NotificationModel(
    uuid: 'uuid',
    title: context.knobs.string(
      label: 'Notification title',
      initialValue: 'We Have New Products With Offers',
    ),
    product: product,
    priceSale: context.knobs.double.slider(
      label: 'Price Sale',
      min: 1,
      max: product.price,
      initialValue: 100,
    ),
    date: 'date',
  );
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardNotification(notification: notification),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Cards',
  type: CardSale,
)
Widget cardSale(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: CardSale(
      title: context.knobs.string(
        label: 'Title Sale',
        initialValue: 'Summer Sales',
      ),
      discount: context.knobs.int.slider(
        label: 'Discount',
        initialValue: 40,
        min: 10,
        max: 90,
      ),
      imagePath: Assets.images.imgSumerSale.path,
    ),
  );
}
