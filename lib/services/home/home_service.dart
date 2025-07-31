import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_m_bagasi/models/home/home_mock_response_model.dart';
import 'package:test_m_bagasi/models/response/response_model.dart';
import 'package:test_m_bagasi/models/result/result.dart';

class HomeService {
  Future<Result<ResponseModel<HomeMockResponseModel?>>> get() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/mock_data/mock_home.json',
      );
      return Result.success(
        ResponseModel.fromJson(
          await json.decode(response),
          (data) => HomeMockResponseModel.fromJson(data),
        ),
      );
    } catch (e) {
      return Result.failed(
        "Terjadi kesalahan pada aplikasi, silahkan coba lagi nanti.",
      );
    }
  }
}
