import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'widgets.dart';

class BaseCachedImage extends StatelessWidget {
  final String url;
  final double? height, width;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  const BaseCachedImage({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.borderRadius,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => AppCard(
        padding: EdgeInsets.zero,
        height: height ?? 150.0,
        width: width ?? double.infinity,
        radius: 0.0,
        backgroundColor: backgroundColor ?? AppColors.grey,
        elevation: 0.0,
        borderRadius: borderRadius,
        child: Image(image: imageProvider, fit: BoxFit.cover),
      ),
      placeholder: (context, url) => AppCard(
        padding: EdgeInsets.zero,
        height: height ?? 150.0,
        width: width ?? double.infinity,
        radius: 0.0,
        backgroundColor: backgroundColor ?? AppColors.grey,
        elevation: 0.0,
        borderRadius: borderRadius,
        child: SizedBox(),
      ),
      errorWidget: (context, url, error) {
        return AppCard(
          padding: EdgeInsets.zero,
          height: height ?? 150.0,
          width: width ?? double.infinity,
          radius: 0.0,
          backgroundColor: backgroundColor ?? AppColors.grey,
          elevation: 0.0,
          borderRadius: borderRadius,
          child: SizedBox(),
        );
      },
    );
  }
}
