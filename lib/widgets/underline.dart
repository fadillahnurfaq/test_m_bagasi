import 'package:flutter/material.dart';
import 'package:test_m_bagasi/utils/utils.dart';

class Underline extends StatelessWidget {
  final double? width, thickness;
  final Color? color;
  const Underline({super.key, this.width, this.thickness, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 150.0,
      child: Divider(
        color: color ?? AppColors.grey50,
        thickness: thickness ?? 1.0,
        height: 1.0,
      ),
    );
  }
}
