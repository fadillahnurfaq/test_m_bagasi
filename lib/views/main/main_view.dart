import 'dart:io';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_m_bagasi/gen/assets.gen.dart';
import 'package:test_m_bagasi/views/home/home_view.dart';
import 'package:test_m_bagasi/widgets/widgets.dart';

import '../../utils/utils.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _menus = [
    HomeView(),
    Center(child: AppText(text: "Sajian")),

    Center(child: AppText(text: "Nusantara")),
    Center(child: AppText(text: "Wishlist")),
    Center(child: AppText(text: "Profile")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: AppText(
            text: "Tekan kembali lagi untuk keluar dari aplikasi",
            textStyle: AppTextStyle.h4,
          ),
          closeIconColor: Colors.red,
          backgroundColor: AppColors.grey50,
          showCloseIcon: true,
        ),
        child: IndexedStack(index: _currentIndex, children: _menus),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
        child: BottomAppBar(
          height: Platform.isIOS ? 80.0 : 70.0,
          padding: Platform.isIOS ? const EdgeInsets.only(bottom: 20.0) : null,
          elevation: 10.0,
          child: BottomNavigationBar(
            backgroundColor: AppColors.white,
            selectedLabelStyle: AppTextStyle.h4.copyWith(fontSize: 12.0),
            unselectedLabelStyle: AppTextStyle.h4.copyWith(fontSize: 12.0),
            currentIndex: _currentIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(
                    _currentIndex == 0
                        ? Assets.icons.homeSelected.path
                        : Assets.icons.homeUnselected.path,
                    height: 24.0,
                    width: 24.0,
                  ),
                ),
                label: "Home",
                tooltip: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(
                    _currentIndex == 1
                        ? Assets.icons.feedSelected.path
                        : Assets.icons.feedUnselected.path,
                    height: 24.0,
                    width: 24.0,
                  ),
                ),
                label: "Sajian",
                tooltip: "Sajian",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(
                    _currentIndex == 2
                        ? Assets.icons.exploreSelected.path
                        : Assets.icons.exploreUnselected.path,
                    height: 24.0,
                    width: 24.0,
                  ),
                ),
                label: "Nusantara",
                tooltip: "Nusantara",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(
                    _currentIndex == 3
                        ? Assets.icons.wishlistSelected.path
                        : Assets.icons.wishlistUnselected.path,
                    height: 24.0,
                    width: 24.0,
                  ),
                ),
                label: "Wishlist",
                tooltip: "Wishlist",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(
                    _currentIndex == 4
                        ? Assets.icons.menuSelected.path
                        : Assets.icons.menuUnselected.path,
                    height: 24.0,
                    width: 24.0,
                  ),
                ),
                label: "Profile",
                tooltip: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
