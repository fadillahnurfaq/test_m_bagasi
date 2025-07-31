import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_m_bagasi/models/home/home_mock_response_model.dart';
import 'package:test_m_bagasi/models/response/response_model.dart';
import 'package:test_m_bagasi/models/result/result.dart';

import '../../services/home/home_service.dart';

class HomeController extends GetxController {
  final HomeService homeService;
  HomeController({required this.homeService});

  Rx<Result<ResponseModel<HomeMockResponseModel?>>> state = Rx(
    Result.initial(),
  );

  Timer? timer;

  void startTimer({required final PageController pageController}) {
    if (state.value.resultValue?.data?.banner.isNotEmpty == true) {
      timer = Timer.periodic(Duration(seconds: 5), (timer) {
        if (pageController.page ==
            (state.value.resultValue?.data?.banner.length ?? 1) - 1) {
          pageController.animateToPage(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  Future<void> get({required final PageController pageController}) async {
    state.value = Result.loading();
    state.refresh();
    // Memberikan delay agar terlihat skeletonziernya
    await Future.delayed(Duration(seconds: 2));
    final result = await homeService.get();
    state.value = result;
    state.refresh();
    startTimer(pageController: pageController);
  }
}
