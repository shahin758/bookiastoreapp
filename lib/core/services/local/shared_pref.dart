import 'dart:convert';

import 'package:bookiastoreapp/feature/auth/data/models/auth_reponse/user.dart';
import 'package:bookiastoreapp/feature/cart/data/model/cart_response/cart_item.dart';
import 'package:bookiastoreapp/feature/home/data/models/best_seller_book_response/product.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  static late SharedPreferences pref;
  static const String kToken = 'token';
  static const String kUser = 'user';
  static const String kWishlist = 'wishlistids';
  static const String kCart = 'cartIds';
  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String value) async {
    await pref.setString(kToken, value);
  }

  static String? getToken() {
    return pref.getString(kToken);
  }

  static Future<void> setUserInfo(User? model) async {
    if (model == null) {
      return;
    }
    //(1) convert object to json
    var objToJson = model.toJson();
    //(2) convert json to string (encoding)
    var jsonToString = jsonEncode(objToJson);
    await pref.setString(kUser, jsonToString);
  }

  static User? getUserInfo() {
    var cachedString = pref.getString(kUser);
    if (cachedString == null) {
      return null;
    }
    var stringToJson = jsonDecode(cachedString);
    var jsonToObject = User.fromJson(stringToJson);
    return jsonToObject;
  }
  //-------------------------------------------------------------------------//
  //for wishlist

  static void cacheWishListIds(List<Product> items) {
    var ids = items.map((item) => item.id.toString()).toList();
    cacheData(kWishlist, ids);
  }

  static List<int> getWishlistIds() {
    var ids = getData(kWishlist);
    if (ids is List<String>) {
      return ids.map((id) => int.tryParse(id) ?? 0).toList();
    } else {
      return [];
    }
  }

//---------------------------------------------------------------------------//
  // for cart

  static void cacheCartIds(List<CartItem> items) {
    var ids = items.map((item) => item.itemProductId.toString()).toList();
    cacheData(kCart, ids);
  }

  static List<int> getCartIds() {
    var ids = getData(kCart);
    if (ids is List<String>) {
      return ids.map((id) => int.tryParse(id) ?? 0).toList();
    } else {
      return [];
    }
  }

  //------------------------------------------------------------------------//

  static Future<void> cacheData(String key, dynamic value) async {
    if (value is String) {
      await pref.setString(key, value);
    } else if (value is int) {
      await pref.setInt(key, value);
    } else if (value is bool) {
      await pref.setBool(key, value);
    } else if (value is double) {
      await pref.setDouble(key, value);
    } else if (value is List<String>) {
      await pref.setStringList(key, value);
    }
  }

  static Object getData(String key) {
    return pref.get(key) ?? '';
  }

  static Future<void> removeData(String key) async {
    await pref.remove(key);
  }

  static Future<void> clearData() async {
    await pref.clear();
  }

  static Future<void> saveUserInfo(
      {required String name,
      required String phone,
      required String address}) async {}
}
