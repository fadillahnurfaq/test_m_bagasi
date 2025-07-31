import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/product_detail/product_detail_controller.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class ProductDetailDescContent extends StatelessWidget {
  const ProductDetailDescContent({super.key});

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
                  text:
                      "3Second - Regular Fit Basic Logo Script Ultra Absorb T Shirt Short Sleeve OL-C450723",
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
                      text: "Produk Fesyen Indonesia",
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
                      text: "Fesyen",
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
                      text: "3Second",
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
                text:
                    "dapatkan kenyamanan abadi dengan kaos original 3second yang timeless ini, pilihan sempurna untuk menemani setiap aktivitasmu. dibuat dari 100% katun berkualitas tinggi, kaos regular fit ini menawarkan kelembutan luar biasa dan daya serap keringat yang optimal, membuatmu tetap nyaman ke mana pun pergi. tersedia dalam warna serbaguna off white (putih) dan jet black (hitam), kaos ini sangat mudah dipadukan dengan berbagai outer dan jenis celana, memastikan kamu selalu siap dan stylish menjalani hari. tersedia dalam ukuran s (lebar dada 52 cm, panjang badan 71 cm, panjang tangan 22 cm), m (lebar dada 54 cm, panjang badan 73 cm, panjang tangan 23 cm), l (lebar dada 56 cm, panjang badan 75 cm, panjang tangan 24 cm), dan xl (lebar dada 58 cm, panjang badan 77 cm, panjang tangan 25 cm). harap diingat, ukuran bisa berbeda sekitar 1-3 cm dan warna produk mungkin sedikit berbeda karena pencahayaan foto atau tampilan gadget.",
                textStyle: AppTextStyle.regularStyle.copyWith(fontSize: 14.0),
              ),
            ],
          ),
        ),
        SpaceHeight(150.0),
      ],
    );
  }
}
