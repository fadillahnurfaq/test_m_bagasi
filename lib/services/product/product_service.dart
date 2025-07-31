import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_m_bagasi/models/product/product_detail_mock_response_model.dart';
import 'package:test_m_bagasi/models/response/response_model.dart';
import 'package:test_m_bagasi/models/result/result.dart';

class ProductService {
  Future<Result<ResponseModel<ProductDetailMockResponseModel?>>> get() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/mock_data/mock_product_detail.json',
      );
      return Result.success(
        ResponseModel.fromJson(
          await json.decode(response),
          (data) => ProductDetailMockResponseModel.fromJson(data),
        ),
      );
    } catch (e) {
      return Result.failed(
        "Terjadi kesalahan pada aplikasi, silahkan coba lagi nanti.",
      );
    }
  }
}
