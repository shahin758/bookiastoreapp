import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/widgets/custome_text_form_field.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookiastoreapp/feature/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfile(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Edit Profile')),
        body: BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is UpdateProfileSuccessState || state is UpdateProfileErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Profile updated successfully')),
              );
              Navigator.pop(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Gap(20),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        BlocBuilder<ProfileCubit, ProfileState>(
                          builder: (context, state) {
                            final profile = context.watch<ProfileCubit>().profileData?.data;
                            return CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage: profile?.image != null
                                  ? NetworkImage(profile!.image!)
                                  : null,
                              child: profile?.image == null ? const Icon(Icons.person, size: 50) : null,
                            );
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          right: -2,
                          child: Container(
                            height: 25,
                            width: 24,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 14,
                              color: AppColors.backgroundcolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(50),
                  CustomeTextFormField(
                    controller: _nameController,
                    hintText: 'Full Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Full name is required';
                      if (value.length < 3) return 'Name too short';
                      return null;
                    },
                  ),
                  Gap(12),
                  CustomeTextFormField(
                    controller: _phoneController,
                    hintText: 'Phone',
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Phone is required';
                      if (value.length < 10) return 'Phone too short';
                      return null;
                    },
                  ),
                  Gap(12),
                  CustomeTextFormField(
                    controller: _addressController,
                    hintText: 'Address',
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Address is required';
                      if (value.length < 5) return 'Address too short';
                      return null;
                    },
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        final isLoading = state is UpdateProfileLoadingState;
                        return MianButton(
                          bgColor: AppColors.primaryColor,
                          text: isLoading ? 'Updating...' : 'Update Profile',
                          textColor: AppColors.backgroundcolor,
                          onPressed: () {
                            if (isLoading) return;
                            if (_formKey.currentState!.validate()) {
                              context.read<ProfileCubit>().updateProfile(
                                name: _nameController.text,
                                phone: _phoneController.text,
                                address: _addressController.text,
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  Gap(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

