import 'package:bookiastoreapp/core/services/dio/apis.dart';
import 'package:bookiastoreapp/core/services/dio/dio_provider.dart';
import 'package:bookiastoreapp/feature/home/data/models/best_seller_book_response/best_seller_book_response.dart';
import 'package:bookiastoreapp/feature/home/data/models/sliders_response/sliders_response.dart';

class HomeRepo {
 static Future<SlidersResponse?> getSliders() async {
    try {
      var response = await DioProvider.get(endpoint: Apis.sliders);
      if (response.statusCode == 200) {
        return SlidersResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

    
   static Future<BestSellerBookResponse?> getBestSellers() async {
      try {
        var response = await DioProvider.get(endpoint: Apis.productsBestseller);
        if (response.statusCode == 200) {
          return BestSellerBookResponse.fromJson(response.data);
        } else {
          return null;
        }
      } catch (e) {
        return null;
      }
    }
  }

