import 'dart:io';

import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/functions/validations.dart';
import 'package:bookiastoreapp/core/services/local/shared_pref.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';
import 'package:bookiastoreapp/core/widgets/custome_text_form_field.dart';
import 'package:bookiastoreapp/core/widgets/dialogs.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/core/widgets/my_body_view.dart';
import 'package:bookiastoreapp/feature/main_profile/presentation/edit_profile/cubit/edite_profile_cubit.dart';
import 'package:bookiastoreapp/feature/main_profile/presentation/edit_profile/cubit/edite_profile_state.dart';
import 'package:bookiastoreapp/feature/main_profile/presentation/edit_profile/widget/custome_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class EditeProfile2 extends StatefulWidget {
  const EditeProfile2({super.key});

  @override
  State<EditeProfile2> createState() => _EditeProfile2State();
}

class _EditeProfile2State extends State<EditeProfile2> {
  String path = '';
  @override
  Widget build(BuildContext context) {
    var profileData = SharedPref.getUserInfo();
    return BlocConsumer<EditeProfileCubit, EditeProfileState>(
      listener: (context, state) {
        if (state is EditeProfileSuccess) {
          pop(context);
          pop(context);
        } else if (state is EditeProfileError) {
          pop(context);
          showMyDialog(context, 'Failed to update profile ,Please try again.');
        } else if (state is EditeProfileLoading) {
          showLoadingDialog(context);
        }
      },
      builder: (context, state) {
        var cubit = context.read<EditeProfileCubit>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edite Profile'),
          ),
          body: MyBodyView(
            child: Column(
              children: [
                Stack(
                  children: [
                    if (path.isNotEmpty)
                      ClipOval(
                        child: Image.file(
                          File(path),
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (path.isEmpty && cubit.imageUrl.isNotEmpty)
                      ClipOval(
                        child: CustomeCachedImage(cubit: cubit),
                      ),
                    if (path.isEmpty && cubit.imageUrl.isEmpty)
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.accentcolor,
                        child: CustomSvgPicture(
                          path: AppImages.profile,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            pickProfileImage();
                          },
                          child: CircleAvatar(
                              radius: 16,
                              backgroundColor: AppColors.backgroundcolor,
                              child: CustomSvgPicture(
                                path: AppImages.camera,
                              )),
                        )),
                  ],
                ),
                Gap(50),
                CustomeTextFormField(
                  controller: cubit.nameController,
                  hintText: 'Full Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Full name is required';
                    }
                    if (value.length < 3) return 'Name too short';
                    return null;
                  },
                ),
                Gap(12),
                CustomeTextFormField(
                  controller: cubit.phoneController,
                  hintText: 'Phone',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty == true &&
                        !isEgyptianPhone(value)) {
                      return 'Please Enter Correct Number';
                    }
                    return null;
                  },
                ),
                Gap(12),
                CustomeTextFormField(
                  controller: cubit.addressController,
                  hintText: 'Address',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address is required';
                    }
                    if (value.length < 5) return 'Address too short';
                    return null;
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: MianButton(
              bgColor: AppColors.primaryColor,
              text: 'Update Profile',
              textColor: AppColors.backgroundcolor,
              onPressed: () {
                cubit.updateProfile(File(path));
              },
            ),
          ),
        );
      },
    );
  }

  void pickProfileImage() async {
    var picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        path = image.path;
      });
    }
  }
}
