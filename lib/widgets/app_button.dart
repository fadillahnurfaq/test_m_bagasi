import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'widgets.dart';

enum ButtonStyleType { filled, outlined }

class AppButton extends StatelessWidget {
  const AppButton.filled({
    super.key,
    required this.onPressed,
    this.label = "",
    this.labelWidget,
    this.style = ButtonStyleType.filled,
    this.color = AppColors.black,
    this.width = double.infinity,
    this.height = 42.0,
    this.borderRadius = 50.0,
    this.icon,
    this.suffixIcon,
    this.disabled = false,
    this.fontSize = 18.0,
    this.textStyle,
    this.sideColor,
    this.overlayColor,
  });

  const AppButton.outlined({
    super.key,
    required this.onPressed,
    this.label = "",
    this.labelWidget,
    this.style = ButtonStyleType.outlined,
    this.color = Colors.transparent,
    this.width = double.infinity,
    this.height = 42.0,
    this.borderRadius = 50.0,
    this.icon,
    this.suffixIcon,
    this.disabled = false,
    this.fontSize = 18.0,
    this.textStyle,
    this.sideColor,
    this.overlayColor,
  });

  final Function() onPressed;
  final String label;
  final Widget? labelWidget;
  final ButtonStyleType style;
  final Color color;
  final double? width;
  final double height;
  final double borderRadius;
  final Widget? icon;
  final Widget? suffixIcon;
  final bool disabled;
  final double fontSize;
  final TextStyle? textStyle;
  final Color? sideColor, overlayColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: style == ButtonStyleType.filled
          ? ElevatedButton(
              onPressed: disabled ? null : onPressed,
              style: ElevatedButton.styleFrom(
                overlayColor: overlayColor ?? AppColors.grey,
                backgroundColor: disabled ? AppColors.grey : color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null && label.isNotEmpty)
                    const SizedBox(width: 5.0),
                  AppText(
                    text: label,
                    textStyle:
                        textStyle ??
                        AppTextStyle.h4.copyWith(color: AppColors.white),
                  ),
                  if (suffixIcon != null && label.isNotEmpty)
                    const SizedBox(width: 5.0),
                  suffixIcon ?? const SizedBox.shrink(),
                ],
              ),
            )
          : OutlinedButton(
              onPressed: disabled ? null : onPressed,
              style: OutlinedButton.styleFrom(
                overlayColor: overlayColor ?? AppColors.grey,
                backgroundColor: disabled ? Colors.grey : color,
                side: BorderSide(
                  color: disabled ? Colors.grey : sideColor ?? AppColors.black,
                  width: 2.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null && label.isNotEmpty)
                    const SizedBox(width: 5.0),
                  labelWidget ??
                      AppText(
                        text: label,
                        textStyle:
                            textStyle ??
                            AppTextStyle.h4.copyWith(color: AppColors.white),
                      ),

                  if (suffixIcon != null && label.isNotEmpty)
                    const SizedBox(width: 5.0),
                  suffixIcon ?? const SizedBox.shrink(),
                ],
              ),
            ),
    );
  }
}
