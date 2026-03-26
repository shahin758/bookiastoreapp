import 'package:bookiastoreapp/core/services/dio/apis.dart';
import 'package:bookiastoreapp/core/services/dio/dio_provider.dart';
import 'package:bookiastoreapp/feature/profile/data/model/profile_response/profile_response.dart';

class ProfileRepo {
static Future<ProfileResponse?> getProfile() async {
    try {
      var response = await DioProvider.get(endpoint: Apis.profile);
      if (response.statusCode == 200) {
        return ProfileResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }


static Future<ProfileResponse?> updateProfile(Map<String, dynamic>? data) async {
    try {
      var response = await DioProvider.post(endpoint: Apis.updateprofile, data: data);
      if (response.statusCode == 200) {
        return ProfileResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<ProfileResponse?> updatePassword(String currentPassword, String newPassword, String confirmPassword) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.updatepassword, 
        data: {
          'current_password': currentPassword,
          'password': newPassword,
          'password_confirmation': confirmPassword,
        }
      );
      if (response.statusCode == 200) {
        return ProfileResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

}

