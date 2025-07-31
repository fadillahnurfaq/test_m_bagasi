import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../models/home/home_mock_response_model.dart';
import '../../../models/response/response_model.dart';
import '../../../utils/app_style.dart';
import '../../../widgets/widgets.dart';

class HomeBrandAsliIndonesiaContent extends StatelessWidget {
  final ResponseModel<HomeMockResponseModel?>? result;
  const HomeBrandAsliIndonesiaContent({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BaseCachedImage(
            url:
                result
                    ?.data
                    ?.brandAsliIndonesia
                    .firstOrNull
                    ?.containerBackground ??
                "",
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
                      text: "Brand Asli Indonesia",
                      textStyle: AppTextStyle.h3,
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
              height: 150.0,
              child: ListView.separated(
                itemCount: result?.data?.brandAsliIndonesia.length ?? 0,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: AppPadding.horizonal,
                separatorBuilder: (context, index) => SpaceWidth(15.0),
                itemBuilder: (context, index) {
                  final brandAsliIndonesia =
                      result!.data!.brandAsliIndonesia[index];
                  return SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: Column(
                      children: [
                        AppCachedImage(
                          height: 100.0,
                          width: 100.0,
                          withCard: true,
                          elevation: 0.0,
                          isCircleBorder: true,
                          backgroundColor: AppColors.white,
                          emptyWidget: Assets.images.noImage.image(
                            fit: BoxFit.fill,
                          ),
                          url: brandAsliIndonesia.imageUrl,
                        ),
                        SpaceHeight(10.0),
                        AppText(
                          text: brandAsliIndonesia.name,
                          textStyle: AppTextStyle.h4,
                          textOverflow: TextOverflow.ellipsis,
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
