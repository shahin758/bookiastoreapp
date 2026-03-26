import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/routes/routes.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/shimmer/list_shimmer.dart';
import 'package:bookiastoreapp/core/widgets/shimmer/text_shimmer.dart';
import 'package:bookiastoreapp/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookiastoreapp/feature/profile/presentation/cubit/profile_state.dart';
import 'package:bookiastoreapp/feature/profile/presentation/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('Profile', style: TextStyles.title24),
          actions: [
            IconButton(
              onPressed: () {
                
                pushReplacement(context, Routes.loginscreen);
                context.read<ProfileCubit>().profileData = null;
              },
              icon: Icon(Icons.logout, color: Colors.black),
            ),
          ],
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ShowProfileLoadingState) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColors.textcolor,
                          child: TextShimmer(width: 40, height: 40),
                        ),
                        Gap(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextShimmer(width: 150, height: 20),
                            Gap(4),
                            TextShimmer(width: 120, height: 16),
                          ],
                        ),
                      ],
                    ),
                    Gap(50),
                    ListShimmer(itemCount: 6), 
                  ],
                ),
              );
            } else if (state is ShowProfileSuccessState) {
              final cubit = context.watch<ProfileCubit>();
              final data = cubit.profileData?.data;
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColors.textcolor,
                          backgroundImage: data?.image != null
                              ? NetworkImage(data!.image!)
                              : null,
                          child: data?.image == null
                              ? Icon(Icons.person, color: Colors.white)
                              : null,
                        ),
                        Gap(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data?.name ?? 'No Name',
                              style: TextStyles.text20.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Gap(4),
                            Text(
                              data?.email ?? 'No Email',
                              style: TextStyles.caption114.copyWith(
                                color: AppColors.textcolor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(50),
                    ListTileWidget(
                      title: 'My Orders',
                      onTap: () {
                        pushTo(context, Routes.myorders);
                      },
                    ),
                    ListTileWidget(
                      title: 'Edit Profile',
                      onTap: () {
                        pushTo(context, Routes.editprofile);
                      },
                    ),
                    ListTileWidget(
                      title: 'Reset Password',
                      onTap: () {
                        pushTo(context, Routes.resetpassword);
                      },
                    ),
                    ListTileWidget(title: 'FAQ', onTap: () {}),
                    ListTileWidget(title: 'Contact Us', onTap: () {}),
                    ListTileWidget(title: 'Privacy & Terms', onTap: () {}),
                  ],
                ),
              );
            } else if (state is ShowProfileErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, size: 64, color: Colors.grey),
                    Gap(16),
                    Text(
                      state.error,
                      style: TextStyles.subtitle18,
                      textAlign: TextAlign.center,
                    ),
                    Gap(16),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<ProfileCubit>().getProfile(),
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(radius: 40, backgroundColor:AppColors.textcolor),
                        Gap(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(
                              'Omar Mohamed',
                              style: TextStyles.text20.copyWith(fontWeight: FontWeight(400))
                            ),
                            Gap(4),
                            Text(
                              'omarmohamed@gmail.com',
                              style: TextStyles.caption114.copyWith(color: AppColors.textcolor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(50),
                    ListTileWidget(title: 'My Orders', onTap: () {pushTo(context, Routes.myorders);}),
                    ListTileWidget(title: 'Edit Profile', onTap: () {pushTo(context, Routes.editprofile);}),
                    ListTileWidget(title: 'Reset Password', onTap: () {pushTo(context, Routes.resetpassword);}),
                    ListTileWidget(title: 'FAQ', onTap: () {}),
                    ListTileWidget(title: 'Contact Us', onTap: () {}),
                    ListTileWidget(title: 'Privacy & Terms', onTap: () {}),
                  ],
                ),
              );
          },
        ),
      ),
    );
  }
}
