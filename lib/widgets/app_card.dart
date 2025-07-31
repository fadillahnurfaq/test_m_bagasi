import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AppCard extends StatelessWidget {
  final double? height, width, elevation;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final double? radius;
  final bool isCircleBorder;
  final Decoration? decoration;
  const AppCard({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.elevation,
    this.onTap,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.radius,
    this.isCircleBorder = false,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: backgroundColor ?? AppColors.white,
        shape: isCircleBorder ? const CircleBorder() : null,
        borderRadius: isCircleBorder
            ? null
            : borderRadius ?? BorderRadius.circular(radius ?? 8.0),
        elevation: elevation ?? 2.0,
        shadowColor: Colors.grey,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          splashColor: AppColors.grey,
          child: Container(
            decoration:
                decoration ??
                BoxDecoration(
                  borderRadius: isCircleBorder
                      ? null
                      : BorderRadius.circular(radius ?? 8.0),
                  color: backgroundColor ?? AppColors.white,
                ),
            child: Padding(
              padding: padding ?? const EdgeInsets.all(10.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
