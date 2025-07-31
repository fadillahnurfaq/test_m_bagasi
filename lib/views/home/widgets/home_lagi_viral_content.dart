import 'package:flutter/material.dart';
import 'package:test_m_bagasi/utils/app_global_func.dart';
import 'package:test_m_bagasi/views/product_detail/product_detail_view.dart';

import '../../../gen/assets.gen.dart';
import '../../../models/home/home_mock_response_model.dart';
import '../../../models/response/response_model.dart';
import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class HomeLagiViralContent extends StatelessWidget {
  final ResponseModel<HomeMockResponseModel?>? result;
  const HomeLagiViralContent({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: BaseCachedImage(
              height: 250.0,
              url:
                  result?.data?.lagiViral.firstOrNull?.containerBackground ??
                  "",
              backgroundColor: AppColors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppPadding.horizonal,
              child: Row(
                children: [
                  Expanded(
                    child: AppText(
                      text: "Lagi Viral",
                      textStyle: AppTextStyle.h3.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  SpaceHeight(10.0),
                  TextButton(
                    onPressed: () {},
                    child: AppText(
                      text: "Lihat Semua",
                      textStyle: AppTextStyle.h4.copyWith(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            SpaceHeight(10.0),
            SizedBox(
              height: 270.0,
              child: ListView.separated(
                itemCount: result?.data?.lagiViral.length ?? 0,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                separatorBuilder: (context, index) => SpaceWidth(15.0),
                itemBuilder: (context, index) {
                  final lagiViral = result!.data!.lagiViral[index];
                  return AppCard(
                    height: 270.0,
                    width: 150.0,
                    elevation: 0.0,
                    onTap: () => Go.to(ProductDetailView()),
                    backgroundColor: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCachedImage(
                          height: 150.0,
                          width: 150.0,
                          withCard: false,
                          url: lagiViral.imageUrl,
                          allowPreview: false,
                          emptyWidget: Assets.images.noImage.image(
                            fit: BoxFit.fill,
                          ),
                        ),
                        SpaceHeight(5.0),
                        AppText(
                          text: lagiViral.name,
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        SpaceHeight(8.0),
                        AppText(
                          text: AppGlobalFunc.formatCurrency(
                            lagiViral.sellingPrice,
                          ),
                          textStyle: AppTextStyle.h4,
                        ),
                        Spacer(),
                        AppCard(
                          padding: EdgeInsets.all(3.0),
                          elevation: 0.0,
                          backgroundColor: AppColors.grey50,
                          radius: 8.0,
                          width: double.infinity,
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            text: TextSpan(
                              text: "${lagiViral.weight ?? 0}",
                              style: AppTextStyle.h4.copyWith(fontSize: 12.0),
                              children: [
                                TextSpan(
                                  text: " Kg",
                                  style: AppTextStyle.regularStyle.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
