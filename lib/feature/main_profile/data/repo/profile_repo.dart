import 'package:bookiastoreapp/core/services/dio/apis.dart';
import 'package:bookiastoreapp/core/services/dio/dio_provider.dart';
import 'package:bookiastoreapp/core/services/local/shared_pref.dart';
import 'package:bookiastoreapp/feature/main_profile/data/model/update_profile_params.dart';
import 'package:bookiastoreapp/feature/main_profile/data/model/update_profile_response/update_profile_response.dart';

class ProfileRepo {
  static Future<UpdateProfileResponse?> editProfile(
      UpdateProfileParams params) async {
    try {
      var response = await DioProvider.post(
          endpoint: Apis.updateprofile,
          data: params.toJson(),
          headers: {
            'Content-Type': 'application/json',
            "authorization": "Bearer ${SharedPref.getToken()}"
          });
      if (response.statusCode == 200) {
        var data = UpdateProfileResponse.fromJson(response.data);
        SharedPref.setUserInfo(data.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }
}
