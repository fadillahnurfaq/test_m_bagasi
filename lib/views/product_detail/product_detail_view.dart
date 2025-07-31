import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_m_bagasi/controllers/product_detail/product_detail_controller.dart';
import 'package:test_m_bagasi/services/product/product_service.dart';
import 'package:test_m_bagasi/views/product_detail/widgets/product_detail_desc_content.dart';
import 'package:test_m_bagasi/views/product_detail/widgets/product_detail_sliver_pinned_price.dart';
import 'package:test_m_bagasi/widgets/widget_animator.dart';
import '../../gen/assets.gen.dart';
import '../../models/product/product_detail_mock_response_model.dart';
import '../../models/response/response_model.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final controller = Get.put(
    ProductDetailController(productService: ProductService()),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              automaticallyImplyLeading: false,
              toolbarHeight: 75.0,
              title: Row(
                spacing: 10.0,
                children: [
                  Expanded(
                    child: Stack(
                      clipBehavior: Clip.antiAlias,
                      children: [
                        SizedBox(
                          height: 45.0,
                          child: Material(
                            color: AppColors.grey,
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(8.0),
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => Go.back(),
                                      behavior: HitTestBehavior.translucent,
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        size: 20.0,
                                      ),
                                    ),
                                    SpaceWidth(5.0),
                                    Container(
                                      width: 1.0,
                                      height: double.infinity,
                                      color: AppColors.grey50,
                                    ),
                                    SpaceWidth(5.0),
                                    Icon(Icons.search),
                                    SpaceWidth(5.0),
                                    Expanded(
                                      child: AppText(
                                        text: "Cari di Master Bagasi",
                                        textOverflow: TextOverflow.ellipsis,
                                        textStyle: AppTextStyle.regularStyle
                                            .copyWith(
                                              fontSize: 14.0,
                                              color: AppColors.grey50,
                                            ),
                                      ),
                                    ),
                                    SpaceWidth(40.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: SizedBox(
                            height: 45.0,
                            width: 45.0,
                            child: Material(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              clipBehavior: Clip.antiAlias,
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Assets.icons.menuSearchBarTransaction
                                      .svg(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 45.0,
                    width: 45.0,
                    child: Material(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Assets.icons.menuSearchBarCart.svg(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45.0,
                    width: 45.0,
                    child: Material(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Assets.icons.menuSearchBarChat.svg(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          body: AppRefresher(
            onRefresh: controller.get,
            child: Obx(
              () =>
                  WidgetAnimator<
                    ResponseModel<ProductDetailMockResponseModel?>
                  >(
                    requestState: controller.state.value,
                    successWidget: (result) {
                      return CustomScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        slivers: [
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: AppPadding.normal.copyWith(bottom: 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 350.0,
                                    width: double.infinity,
                                    child: PageView.builder(
                                      itemCount:
                                          result?.data?.productAssets.length ??
                                          0,
                                      itemBuilder: (context, index) {
                                        final productAsset =
                                            result!.data!.productAssets[index];

                                        return AppCachedImage(
                                          height: 350.0,
                                          width: double.infinity,
                                          elevation: 0.0,
                                          url: productAsset.url,
                                          emptyWidget: Assets.images.noImage
                                              .image(fit: BoxFit.fill),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ProductDetailSliverPinnedPrice(),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: AppPadding.normal.copyWith(top: 0.0),
                              child: ProductDetailDescContent(result: result),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => WidgetAnimator<ResponseModel<ProductDetailMockResponseModel?>>(
          requestState: controller.state.value,
          successWidget: (result) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 8.0,
                children: [
                  AppCard(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: AppColors.black, width: 2.0),
                    ),
                    onTap: () {},
                    child: Icon(Icons.message, size: 20.0),
                  ),

                  Obx(
                    () => Expanded(
                      child: AppButton.outlined(
                        height: 40.0,
                        onPressed: () {},
                        disabled:
                            controller.selectedProductVariant.value == null,
                        color: AppColors.white,
                        overlayColor: AppColors.black,
                        borderRadius: 8.0,
                        label: "Beli Langsung",
                        textStyle: AppTextStyle.h4.copyWith(
                          color: controller.selectedProductVariant.value == null
                              ? AppColors.grey50
                              : AppColors.black,
                        ),
                      ),
                    ),
                  ),

                  Obx(
                    () => Expanded(
                      child: AppButton.outlined(
                        height: 40.0,
                        onPressed: () {},
                        disabled:
                            controller.selectedProductVariant.value == null,
                        color: AppColors.black,
                        borderRadius: 8.0,
                        icon: Icon(
                          Icons.add,
                          color: controller.selectedProductVariant.value == null
                              ? AppColors.grey50
                              : AppColors.white,
                          size: 20.0,
                        ),
                        label: "Keranjang",
                        textStyle: AppTextStyle.h4.copyWith(
                          color: controller.selectedProductVariant.value == null
                              ? AppColors.grey50
                              : AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
