import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookiastoreapp/feature/profile/data/repo/profile_repo.dart';
import 'package:bookiastoreapp/feature/profile/presentation/cubit/profile_state.dart';
import 'package:bookiastoreapp/feature/profile/data/model/profile_response/profile_response.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  ProfileResponse? profileData;

  Future<void> getProfile() async {
    emit(ShowProfileLoadingState());
    try {
      final data = await ProfileRepo.getProfile();
      if (data != null) {
        profileData = data;
        emit(ShowProfileSuccessState());
      } else {
        emit(ShowProfileErrorState('Failed to load profile'));
      }
    } catch (e) {
      emit(ShowProfileErrorState(e.toString()));
    }
  }

  Future<void> updateProfile({
    String? name,
    String? phone,
    String? address,
  }) async {
    emit(UpdateProfileLoadingState());
    try {
      final updateData = <String, dynamic>{};
      if (name != null) updateData['name'] = name;
      if (phone != null) updateData['phone'] = phone;
      if (address != null) updateData['address'] = address;
      final data = await ProfileRepo.updateProfile(updateData);
      if (data != null) {
        profileData = data;
        emit(UpdateProfileSuccessState());
      } else {
        emit(UpdateProfileErrorState('Failed to update profile'));
      }
    } catch (e) {
      emit(UpdateProfileErrorState(e.toString()));
    }
  }

  Future<void> updatePassword(String currentPassword, String newPassword, String confirmPassword) async {
    emit(UpdatePasswordLoadingState());
    try {
      final data = await ProfileRepo.updatePassword(currentPassword, newPassword, confirmPassword);
      if (data != null) {
        emit(UpdatePasswordSuccessState());
      } else {
        emit(UpdatePasswordErrorState('Failed to update password'));
      }
    } catch (e) {
      emit(UpdatePasswordErrorState(e.toString()));
    }
  }
}

