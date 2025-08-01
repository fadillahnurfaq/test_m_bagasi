// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/explore_selected.svg
  SvgGenImage get exploreSelected =>
      const SvgGenImage('assets/icons/explore_selected.svg');

  /// File path: assets/icons/explore_unselected.svg
  SvgGenImage get exploreUnselected =>
      const SvgGenImage('assets/icons/explore_unselected.svg');

  /// File path: assets/icons/feed_selected.svg
  SvgGenImage get feedSelected =>
      const SvgGenImage('assets/icons/feed_selected.svg');

  /// File path: assets/icons/feed_unselected.svg
  SvgGenImage get feedUnselected =>
      const SvgGenImage('assets/icons/feed_unselected.svg');

  /// File path: assets/icons/home_selected.svg
  SvgGenImage get homeSelected =>
      const SvgGenImage('assets/icons/home_selected.svg');

  /// File path: assets/icons/home_unselected.svg
  SvgGenImage get homeUnselected =>
      const SvgGenImage('assets/icons/home_unselected.svg');

  /// File path: assets/icons/location.svg
  SvgGenImage get location => const SvgGenImage('assets/icons/location.svg');

  /// File path: assets/icons/love_circle.svg
  SvgGenImage get loveCircle =>
      const SvgGenImage('assets/icons/love_circle.svg');

  /// File path: assets/icons/love_circle_black.svg
  SvgGenImage get loveCircleBlack =>
      const SvgGenImage('assets/icons/love_circle_black.svg');

  /// File path: assets/icons/menu_search_bar_cart.svg
  SvgGenImage get menuSearchBarCart =>
      const SvgGenImage('assets/icons/menu_search_bar_cart.svg');

  /// File path: assets/icons/menu_search_bar_chat.svg
  SvgGenImage get menuSearchBarChat =>
      const SvgGenImage('assets/icons/menu_search_bar_chat.svg');

  /// File path: assets/icons/menu_search_bar_transaction.svg
  SvgGenImage get menuSearchBarTransaction =>
      const SvgGenImage('assets/icons/menu_search_bar_transaction.svg');

  /// File path: assets/icons/menu_selected.svg
  SvgGenImage get menuSelected =>
      const SvgGenImage('assets/icons/menu_selected.svg');

  /// File path: assets/icons/menu_unselected.svg
  SvgGenImage get menuUnselected =>
      const SvgGenImage('assets/icons/menu_unselected.svg');

  /// File path: assets/icons/share_circle.svg
  SvgGenImage get shareCircle =>
      const SvgGenImage('assets/icons/share_circle.svg');

  /// File path: assets/icons/wishlist_selected.svg
  SvgGenImage get wishlistSelected =>
      const SvgGenImage('assets/icons/wishlist_selected.svg');

  /// File path: assets/icons/wishlist_unselected.svg
  SvgGenImage get wishlistUnselected =>
      const SvgGenImage('assets/icons/wishlist_unselected.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    exploreSelected,
    exploreUnselected,
    feedSelected,
    feedUnselected,
    homeSelected,
    homeUnselected,
    location,
    loveCircle,
    loveCircleBlack,
    menuSearchBarCart,
    menuSearchBarChat,
    menuSearchBarTransaction,
    menuSelected,
    menuUnselected,
    shareCircle,
    wishlistSelected,
    wishlistUnselected,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/no_data.png
  AssetGenImage get noData => const AssetGenImage('assets/images/no_data.png');

  /// File path: assets/images/no_image.png
  AssetGenImage get noImage =>
      const AssetGenImage('assets/images/no_image.png');

  /// List of all assets
  List<AssetGenImage> get values => [noData, noImage];
}

class $AssetsMockDataGen {
  const $AssetsMockDataGen();

  /// File path: assets/mock_data/mock_home.json
  String get mockHome => 'assets/mock_data/mock_home.json';

  /// File path: assets/mock_data/mock_product_detail.json
  String get mockProductDetail => 'assets/mock_data/mock_product_detail.json';

  /// List of all assets
  List<String> get values => [mockHome, mockProductDetail];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsMockDataGen mockData = $AssetsMockDataGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
