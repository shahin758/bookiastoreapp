import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/routes/routes.dart';
import 'package:bookiastoreapp/core/services/local/shared_pref.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/my_body_view.dart';
import 'package:bookiastoreapp/feature/main_profile/presentation/profile/widget/list_tile_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen2 extends StatelessWidget {
  const ProfileScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    var profileData = SharedPref.getUserInfo();
    return Scaffold(
      appBar: AppBar(
        title:  Text('profile'.tr()),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout, color: Colors.black),
          )
        ],
      ),
      body: MyBodyView(
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: profileData?.image ?? '',
                      height: 100,
                      width: 100,
                      progressIndicatorBuilder: (context, url, progress) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.person,
                        size: 100,
                        color: AppColors.primaryColor,
                      ),
                    )),
                Gap(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profileData?.name ?? '',
                      style: TextStyles.text20,
                    ),
                    Text(
                      profileData?.email ?? '',
                      style: TextStyles.caption114
                          .copyWith(color: AppColors.textcolor),
                    ),
                  ],
                )
              ],
            ),
            Gap(40),
             ListTileWidget(
                      title: 'My Orders',
                      onTap: () {
                        pushTo(context, Routes.myorders);
                      },
                    ),
                    ListTileWidget(
                      title: 'Edit Profile',
                      onTap: () {
                        pushTo(context, Routes.editprofile2);
                      },
                    ),
                    ListTileWidget(
                      title: 'Reset Password',
                      onTap: () {
                        pushTo(context, Routes.updatepassword);
                      },
                    ),
                    ListTileWidget(title: 'FAQ', onTap: () {}),
                    ListTileWidget(title: 'Contact Us', onTap: () {}),
                    ListTileWidget(title: 'Privacy & Terms', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
