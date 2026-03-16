import 'package:bookiastoreapp/core/services/local/shared_pref.dart';
import 'package:bookiastoreapp/feature/home/data/models/best_seller_book_response/product.dart';
import 'package:bookiastoreapp/feature/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookiastoreapp/feature/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishListInitial());

  List<Product> products = [];

  Future<void> getWishList() async {
    emit(WishListLoadingState());
    var data = await WishlistRepo.getWishList();
    if (data != null) {
      products = data.data?.products ?? [];
      var ids = products.map((item) => item.id.toString()).toList();
      SharedPref.cacheWishListIds(products);
      emit(WishListSuccessState());
    } else {
      emit(WishListErrorState());
    }
  }

  Future<void> removeFromWishList(int productId) async {
    emit(WishListLoadingState());
    var data = await WishlistRepo.removeFromWishList(productId);
    if (data != null) {
      products = data.data?.products ?? [];
      var ids = products.map((item) => item.id.toString()).toList();
      SharedPref.cacheWishListIds(products);
      emit(WishListSuccessState());
    } else {
      emit(WishListErrorState());
    }
  }
}
