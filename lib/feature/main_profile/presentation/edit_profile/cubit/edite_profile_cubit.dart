import 'dart:io';

import 'package:bookiastoreapp/core/services/local/shared_pref.dart';
import 'package:bookiastoreapp/feature/main_profile/data/model/update_profile_params.dart';
import 'package:bookiastoreapp/feature/main_profile/data/repo/profile_repo.dart';
import 'package:bookiastoreapp/feature/main_profile/presentation/edit_profile/cubit/edite_profile_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditeProfileCubit extends Cubit<EditeProfileState> {
  EditeProfileCubit() : super(EditeProfileInitial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String imageUrl = '';
  final formKey = GlobalKey<FormState>();

  void loadInitialData() {
    var profileData = SharedPref.getUserInfo();
    nameController.text = profileData?.name ?? '';
    phoneController.text = profileData?.phone ?? '';
    addressController.text = profileData?.address ?? '';
    imageUrl = profileData?.image ?? '';
    emit(EditeProfileSuccess());
  }

  void updateProfile(File image) async {
    emit(EditeProfileLoading());
    var params = UpdateProfileParams(
      name: nameController.text,
      phone: phoneController.text,
      address: addressController.text,
      image: image,
    );
    var data = await ProfileRepo.editProfile(params);
    if (data != null) {
      emit(EditeProfileSuccess());
    } else {
      emit(EditeProfileError());
    }
  }
}
