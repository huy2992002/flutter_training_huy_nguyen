/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_avatar.png
  AssetGenImage get imgAvatar =>
      const AssetGenImage('assets/images/img_avatar.png');

  /// File path: assets/images/img_logo.png
  AssetGenImage get imgLogo =>
      const AssetGenImage('assets/images/img_logo.png');

  /// File path: assets/images/img_nike_air_max.png
  AssetGenImage get imgNikeAirMax =>
      const AssetGenImage('assets/images/img_nike_air_max.png');

  /// File path: assets/images/img_nike_air_max_200.png
  AssetGenImage get imgNikeAirMax200 =>
      const AssetGenImage('assets/images/img_nike_air_max_200.png');

  /// File path: assets/images/img_nike_air_max_270.png
  AssetGenImage get imgNikeAirMax270 =>
      const AssetGenImage('assets/images/img_nike_air_max_270.png');

  /// File path: assets/images/img_nike_club_max.png
  AssetGenImage get imgNikeClubMax =>
      const AssetGenImage('assets/images/img_nike_club_max.png');

  /// File path: assets/images/img_nike_jordan.png
  AssetGenImage get imgNikeJordan =>
      const AssetGenImage('assets/images/img_nike_jordan.png');

  /// File path: assets/images/img_onboard_1.png
  AssetGenImage get imgOnboard1 =>
      const AssetGenImage('assets/images/img_onboard_1.png');

  /// File path: assets/images/img_onboard_2.png
  AssetGenImage get imgOnboard2 =>
      const AssetGenImage('assets/images/img_onboard_2.png');

  /// File path: assets/images/img_onboard_3.png
  AssetGenImage get imgOnboard3 =>
      const AssetGenImage('assets/images/img_onboard_3.png');

  /// File path: assets/images/img_pr_onboard_1.png
  AssetGenImage get imgPrOnboard1 =>
      const AssetGenImage('assets/images/img_pr_onboard_1.png');

  /// File path: assets/images/img_pr_onboard_2.png
  AssetGenImage get imgPrOnboard2 =>
      const AssetGenImage('assets/images/img_pr_onboard_2.png');

  /// File path: assets/images/img_pr_onboard_3.png
  AssetGenImage get imgPrOnboard3 =>
      const AssetGenImage('assets/images/img_pr_onboard_3.png');

  /// File path: assets/images/img_successfully.png
  AssetGenImage get imgSuccessfully =>
      const AssetGenImage('assets/images/img_successfully.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        imgAvatar,
        imgLogo,
        imgNikeAirMax,
        imgNikeAirMax200,
        imgNikeAirMax270,
        imgNikeClubMax,
        imgNikeJordan,
        imgOnboard1,
        imgOnboard2,
        imgOnboard3,
        imgPrOnboard1,
        imgPrOnboard2,
        imgPrOnboard3,
        imgSuccessfully
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
