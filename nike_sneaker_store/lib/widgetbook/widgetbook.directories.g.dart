// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:nike_sneaker_store/widgetbook/widgetbook.dart' as _i2;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookFolder(
        name: 'app_bar',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'AppBarHome',
            useCase: _i1.WidgetbookUseCase(
              name: 'AppBar',
              builder: _i2.appBarHome,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'NSAppBar',
            useCase: _i1.WidgetbookUseCase(
              name: 'AppBar',
              builder: _i2.nsAppBar,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'avatar',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'NSAvatar',
            useCase: _i1.WidgetbookUseCase(
              name: 'Avatar',
              builder: _i2.nsAvatar,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'button',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'NSElevatedButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'Button',
              builder: _i2.elevatedButton,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'NsIconButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'Button',
              builder: _i2.iconButton,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'cards',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'CardCartProduct',
            useCase: _i1.WidgetbookUseCase(
              name: 'Cards',
              builder: _i2.cardCartProduct,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'CardCategory',
            useCase: _i1.WidgetbookUseCase(
              name: 'Cards',
              builder: _i2.cardCategory,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'CardNotification',
            useCase: _i1.WidgetbookUseCase(
              name: 'Cards',
              builder: _i2.cardNotification,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'CardSale',
            useCase: _i1.WidgetbookUseCase(
              name: 'Cards',
              builder: _i2.cardSale,
            ),
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'otp',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'NSOtpCode',
            useCase: _i1.WidgetbookUseCase(
              name: 'OTP',
              builder: _i2.nsOTPCode,
            ),
          )
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'text_form_field',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'NSTextFormField',
            useCase: _i1.WidgetbookUseCase(
              name: 'TextField',
              builder: _i2.nsTextFormField,
            ),
          )
        ],
      ),
    ],
  )
];
