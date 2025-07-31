import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_m_bagasi/utils/app_global_func.dart';

import '../../../controllers/product_detail/product_detail_controller.dart';
import '../../../models/product/product_detail_mock_response_model.dart';
import '../../../models/response/response_model.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class ProductDetailDescContent extends StatelessWidget {
  final ResponseModel<ProductDetailMockResponseModel?>? result;
  const ProductDetailDescContent({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductDetailController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCard(
          elevation: 0.0,
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpaceHeight(10.0),
              Padding(
                padding: AppPadding.horizonal,
                child: AppText(
                  text: AppGlobalFunc.getText(
                    result?.data?.productDetail?.name,
                  ),
                  textStyle: AppTextStyle.h4,
                ),
              ),
              SpaceHeight(10.0),
              Obx(() {
                final groupedVariants = controller.groupedVariants.value;
                final variantNames = groupedVariants.keys.toList();
                final selectedVariants = controller.selectedVariants.value;
                return ListView.separated(
                  itemCount: variantNames.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  separatorBuilder: (context, index) => SpaceHeight(10.0),
                  itemBuilder: (context, index) {
                    final variantName = variantNames[index];
                    final List<String>? variantValues =
                        groupedVariants[variantName];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: AppPadding.horizonal,
                          child: AppText(
                            text: variantName,
                            textStyle: AppTextStyle.h4,
                          ),
                        ),
                        SizedBox(
                          height: 60.0,
                          child: ListView.separated(
                            itemCount: variantValues?.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.all(10.0).copyWith(left: 15.0),
                            physics: BouncingScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                SpaceWidth(10.0),
                            itemBuilder: (context, index) {
                              final variantValue = variantValues![index];
                              final isSelected =
                                  selectedVariants[variantName] == variantValue;
                              return Material(
                                borderRadius: BorderRadius.circular(8.0),
                                clipBehavior: Clip.antiAlias,
                                color: isSelected
                                    ? AppColors.black
                                    : AppColors.white,
                                child: InkWell(
                                  onTap: () {
                                    controller.setSelectedVariant(
                                      variantName: variantName,
                                      variantValue: variantValue,
                                    );
                                    controller.refreshSelectedVariant();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 15.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: AppColors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: AppText(
                                        text: variantValue,
                                        textStyle: AppTextStyle.regularStyle
                                            .copyWith(
                                              color: isSelected
                                                  ? AppColors.white
                                                  : AppColors.black,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
            ],
          ),
        ),
        SpaceHeight(10.0),
        AppCard(
          elevation: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(text: "Detail Produk", textStyle: AppTextStyle.h4),
              SpaceHeight(10.0),
              ExpandedView2Row(
                flex1: 40,
                flex2: 60,
                child1: AppText(
                  text: "Sertifikasi",
                  textStyle: AppTextStyle.regularStyle.copyWith(fontSize: 14.0),
                ),
                child2: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: AppGlobalFunc.getText(
                        result?.data?.productDetail?.productCertification,
                      ),
                      textStyle: AppTextStyle.regularStyle.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                    SpaceHeight(5.0),
                    Underline(width: double.infinity, thickness: 3.0),
                  ],
                ),
              ),
              SpaceHeight(5.0),
              ExpandedView2Row(
                flex1: 40,
                flex2: 60,
                child1: AppText(
                  text: "Kategori",
                  textStyle: AppTextStyle.regularStyle.copyWith(fontSize: 14.0),
                ),
                child2: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: AppGlobalFunc.getText(
                        result?.data?.productDetail?.categoryName,
                      ),
                      textStyle: AppTextStyle.regularStyle.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                    SpaceHeight(5.0),
                    Underline(width: double.infinity, thickness: 3.0),
                  ],
                ),
              ),
              SpaceHeight(5.0),
              ExpandedView2Row(
                flex1: 40,
                flex2: 60,
                child1: AppText(
                  text: "Brand",
                  textStyle: AppTextStyle.regularStyle.copyWith(fontSize: 14.0),
                ),
                child2: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: AppGlobalFunc.getText(
                        result?.data?.productDetail?.brandName,
                      ),
                      textStyle: AppTextStyle.regularStyle.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                    SpaceHeight(5.0),
                    Underline(width: double.infinity, thickness: 3.0),
                  ],
                ),
              ),
            ],
          ),
        ),
        SpaceHeight(10.0),
        AppCard(
          elevation: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(text: "Deskripsi Produk", textStyle: AppTextStyle.h4),
              SpaceHeight(10.0),
              AppText(
                text: AppGlobalFunc.getText(result?.data?.productDetail?.desc),
                textStyle: AppTextStyle.regularStyle.copyWith(fontSize: 14.0),
              ),
            ],
          ),
        ),
        SpaceHeight(100.0),
      ],
    );
  }
}
