import 'dart:async';
import 'package:get/get.dart';
import 'package:test_m_bagasi/models/product/product_detail_mock_response_model.dart';
import 'package:test_m_bagasi/models/response/response_model.dart';
import 'package:test_m_bagasi/models/result/result.dart';
import 'package:test_m_bagasi/services/product/product_service.dart';

class ProductDetailController extends GetxController {
  final ProductService productService;
  ProductDetailController({required this.productService});

  Rx<Result<ResponseModel<ProductDetailMockResponseModel?>>> state = Rx(
    Result.initial(),
  );

  Rx<Map<String, String>> selectedVariants = Rx({});
  Rx<Map<String, List<String>>> groupedVariants = Rx({});
  Rx<ProductVariant?> selectedProductVariant = Rx(null);

  Future<void> get() async {
    state.value = Result.loading();
    state.refresh();
    // Memberikan delay agar terlihat skeletonziernya
    await Future.delayed(Duration(seconds: 2));
    final result = await productService.get();
    state.value = result;
    state.refresh();
    final List<ProductVariant> productVariants =
        state.value.resultValue?.data?.productVariant ?? [];
    groupedVariants.value = ProductDetailMockResponseModel.groupVariants(
      productVariants,
    );
    groupedVariants.value.forEach((variantName, variantValues) {
      if (variantValues.isNotEmpty) {
        selectedVariants.value[variantName] = variantValues.first;
      }
    });
    refreshSelectedVariant();
  }

  void refreshSelectedVariant() {
    final List<ProductVariant> productVariants =
        state.value.resultValue?.data?.productVariant ?? [];
    final filteredVariant = productVariants.firstWhereOrNull((productVariant) {
      return selectedVariants.value.entries.every((selectedEntry) {
        final selectedVariantName = selectedEntry.key;
        final selectedVariantValue = selectedEntry.value;

        return productVariant.variants.any(
          (v) =>
              v.name == selectedVariantName && v.value == selectedVariantValue,
        );
      });
    });
    selectedProductVariant.value = filteredVariant;
    selectedProductVariant.refresh();
  }

  void setSelectedVariant({
    required final String variantName,
    required final String variantValue,
  }) {
    selectedVariants.value[variantName] = variantValue;
    selectedVariants.refresh();
  }
}
