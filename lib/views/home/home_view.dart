import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_m_bagasi/controllers/home/home_controller.dart';
import 'package:test_m_bagasi/gen/assets.gen.dart';
import 'package:test_m_bagasi/services/home/home_service.dart';
import 'package:test_m_bagasi/utils/utils.dart';
import 'package:test_m_bagasi/views/home/widgets/home_brand_asli_indonesia_content.dart';
import 'package:test_m_bagasi/views/home/widgets/home_lagi_viral_content.dart';
import 'package:test_m_bagasi/widgets/widget_animator.dart';
import 'package:test_m_bagasi/widgets/widgets.dart';

import '../../models/home/home_mock_response_model.dart';
import '../../models/response/response_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final PageController _pageController;
  final controller = Get.put(HomeController(homeService: HomeService()));

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.get(pageController: _pageController);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.timer?.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
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
                                  Icon(Icons.search),
                                  SpaceWidth(5.0),
                                  AppText(
                                    text: "Cari di Master Bagasi",
                                    textStyle: AppTextStyle.regularStyle
                                        .copyWith(
                                          fontSize: 14.0,
                                          color: AppColors.grey50,
                                        ),
                                  ),
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
          onRefresh: () async =>
              controller.get(pageController: _pageController),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Obx(
                () => WidgetAnimator<ResponseModel<HomeMockResponseModel?>>(
                  requestState: controller.state.value,
                  successWidget: (result) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 10.0,
                          ),
                          color: AppColors.black,
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Assets.icons.location.svg(
                                      height: 24.0,
                                      width: 24.0,
                                    ),
                                    SpaceWidth(10.0),
                                    Expanded(
                                      child: AppText(
                                        text: "Dikirim ke",
                                        textStyle: AppTextStyle.regularStyle
                                            .copyWith(
                                              color: AppColors.grey50,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SpaceWidth(10.0),
                              Flexible(
                                child: AppButton.outlined(
                                  onPressed: () {},
                                  borderRadius: 8.0,
                                  sideColor: AppColors.white,
                                  label: "Kirim Barang Pribadi",
                                  textStyle: AppTextStyle.h4.copyWith(
                                    color: AppColors.white,
                                    fontSize: 12.0,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 20.0,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SpaceHeight(10.0),
                        Stack(
                          children: [
                            Padding(
                              padding: AppPadding.horizonal,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SizedBox(
                                  height: 200.0,
                                  width: double.infinity,
                                  child: PageView.builder(
                                    itemCount: result?.data?.banner.length ?? 0,
                                    controller: _pageController,
                                    clipBehavior: Clip.antiAlias,
                                    padEnds: false,
                                    itemBuilder: (context, index) {
                                      final banner =
                                          result!.data!.banner[index];
                                      return AppCachedImage(
                                        height: 200.0,
                                        width: double.infinity,
                                        backgroundColor: AppColors.grey50,
                                        radius: 0,
                                        url: banner.url,
                                        withCard: false,
                                        emptyWidget: Assets.images.noImage
                                            .image(fit: BoxFit.fill),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            if (result?.data?.banner.isNotEmpty == true)
                              Positioned(
                                left: 0,
                                bottom: 15.0,
                                right: 0,
                                child: Center(
                                  child: SmoothPageIndicator(
                                    controller: _pageController,
                                    count: result!.data!.banner.length,
                                    onDotClicked: (index) =>
                                        _pageController.animateToPage(
                                          index,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeIn,
                                        ),
                                    effect: ScrollingDotsEffect(
                                      dotColor: AppColors.grey,
                                      activeDotColor: AppColors.white,
                                      dotHeight: 10.0,
                                      dotWidth: 10.0,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SpaceHeight(10.0),
                        HomeBrandAsliIndonesiaContent(result: result),
                        SpaceHeight(15.0),
                        HomeLagiViralContent(result: result),
                        SpaceHeight(50.0),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
