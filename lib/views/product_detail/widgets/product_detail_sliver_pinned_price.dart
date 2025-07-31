// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_m_bagasi/controllers/product_detail/product_detail_controller.dart';
import 'package:test_m_bagasi/utils/app_global_func.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class ProductDetailSliverPinnedPrice extends StatelessWidget {
  const ProductDetailSliverPinnedPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: PinnedPriceDelegate(),
    );
  }
}

class PinnedPriceDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 72.0;

  @override
  double get minExtent => 72.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return _PinnedPriceContent();
  }
}

class _PinnedPriceContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductDetailController>();
    return Obx(
      () => AppCard(
        height: 72.0,
        width: double.infinity,
        elevation: 0.0,
        backgroundColor: AppColors.grey50,
        radius: 0.0,
        child: Row(
          children: [
            Expanded(
              child: AppCard(
                padding: EdgeInsets.all(5.0),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(8.0),
                ),
                elevation: 0.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: controller.selectedProductVariant.value == null
                          ? "Varian tidak ditemukan"
                          : AppGlobalFunc.formatCurrency(
                              controller
                                  .selectedProductVariant
                                  .value
                                  ?.sellingPrice,
                            ),
                      textStyle: AppTextStyle.h3.copyWith(
                        color: controller.selectedProductVariant.value == null
                            ? Colors.blueAccent
                            : AppColors.black,
                      ),
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            SpaceWidth(3.0),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 50.0),
              child: AppCard(
                padding: EdgeInsets.all(5.0),
                borderRadius: BorderRadius.circular(0.0),
                elevation: 0.0,
                child: controller.selectedProductVariant.value == null
                    ? Column()
                    : Center(
                        child: AppText(
                          text:
                              "${controller.selectedProductVariant.value?.weight} Kg",
                          textStyle: AppTextStyle.regularStyle,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
              ),
            ),
            SpaceWidth(3.0),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 50.0),
              child: AppCard(
                padding: EdgeInsets.all(5.0),
                borderRadius: BorderRadius.circular(0.0),
                elevation: 0.0,
                child: Center(
                  child: Assets.icons.loveCircle.svg(height: 30.0, width: 30.0),
                ),
              ),
            ),
            SpaceWidth(3.0),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 50.0),
              child: AppCard(
                padding: EdgeInsets.all(5.0),
                borderRadius: BorderRadius.circular(0.0),
                elevation: 0.0,
                child: Center(
                  child: Assets.icons.shareCircle.svg(
                    height: 30.0,
                    width: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
