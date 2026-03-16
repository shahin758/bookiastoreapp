import 'dart:developer';

import 'package:bookiastoreapp/core/services/dio/apis.dart';
import 'package:bookiastoreapp/core/services/dio/dio_provider.dart';
import 'package:bookiastoreapp/core/services/local/shared_pref.dart';
import 'package:bookiastoreapp/feature/wishlist/data/model/wish_list_response/wish_list_response.dart';

class WishlistRepo {
  static Future<WishListResponse?> getWishList() async {
    try {
      var response = await DioProvider.get(
        endpoint: Apis.wishlist,
        queryParameters: {"page": 1},
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );

      if (response.statusCode == 200) {
        return WishListResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<WishListResponse?> addToWishList(int productId) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.addTowishlist,
        queryParameters: {"page": 1},
        data: {"product_id": productId},
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );

      if (response.statusCode == 200) {
        log('------------------1--------------');
        return WishListResponse.fromJson(response.data);
      } else {
        log('------------------2--------------');
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<WishListResponse?> removeFromWishList(int productId) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.removeFromwishlist,
        queryParameters: {"page": 1},
        data: {"product_id": productId},
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );

      if (response.statusCode == 200) {
        return WishListResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
