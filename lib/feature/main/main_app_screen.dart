import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';
import 'package:flutter/material.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
   Center(child: Text('Home'),),
   Center(child: Text('WishList'),),
   Center(child: Text('cart'),),
   Center(child: Text('Profile'),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: _bottomNavBar(),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.home),
          activeIcon: CustomSvgPicture(
            path: AppImages.home,
            color: AppColors.primaryColor,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.bookmark),
          activeIcon: CustomSvgPicture(
            path: AppImages.bookmark,
            color: AppColors.primaryColor,
          ),
          label: 'WishList',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.cart),
          activeIcon: CustomSvgPicture(
            path: AppImages.cart,
            color: AppColors.primaryColor,
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: CustomSvgPicture(path: AppImages.profile),
          activeIcon: CustomSvgPicture(
            path: AppImages.profile,
            color: AppColors.primaryColor,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
