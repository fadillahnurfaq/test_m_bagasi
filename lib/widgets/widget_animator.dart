import 'package:flutter/material.dart';
import 'package:test_m_bagasi/models/result/result.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../gen/assets.gen.dart';
import '../utils/utils.dart';
import 'widgets.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.noData.image(
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ],
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final String message;
  final Color? iconColor, textColor;
  const ErrorWidget({
    super.key,
    required this.message,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning, size: 35.0, color: iconColor ?? Colors.red),
          const SpaceHeight(10.0),
          AppText(
            text: message,
            align: TextAlign.center,
            textStyle: AppTextStyle.regularStyle.copyWith(
              color: textColor ?? AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.black),
    );
  }
}

class WidgetAnimator<T> extends StatelessWidget {
  final Result<T> requestState;
  final Widget loadingWidget;
  final Widget Function(T? result) successWidget;
  final Widget Function(String message)? errorWidget;
  final Widget Function(String message)? emptyWidget;
  final Widget initialWidget;
  final Color? iconColor, textColor;
  final bool withSkeletonizer;

  const WidgetAnimator({
    super.key,
    required this.requestState,
    required this.successWidget,
    this.loadingWidget = const LoadingWidget(),
    this.errorWidget,
    this.emptyWidget,
    this.initialWidget = const SizedBox(),
    this.iconColor,
    this.textColor,
    this.withSkeletonizer = true,
  });

  @override
  Widget build(BuildContext context) {
    return _getChild();
  }

  _getChild() {
    switch (requestState) {
      case Failed _:
        if (errorWidget != null) {
          return errorWidget!(requestState.errorMessage ?? "");
        } else {
          return ErrorWidget(
            message: requestState.errorMessage ?? "",
            iconColor: iconColor,
            textColor: textColor,
          );
        }
      case Initial _:
        return initialWidget;
      case Empty _:
        return emptyWidget ?? EmptyWidget();
      case Success _ || Loading _:
        return withSkeletonizer
            ? Skeletonizer(
                enabled: requestState.isLoading,
                child: successWidget(requestState.resultValue),
              )
            : requestState.isLoading
            ? loadingWidget
            : successWidget(requestState.resultValue);
    }
  }
}
