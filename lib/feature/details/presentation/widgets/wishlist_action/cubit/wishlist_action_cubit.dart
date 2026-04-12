import 'package:bookiastoreapp/core/services/local/shared_pref.dart';
import 'package:bookiastoreapp/feature/details/presentation/widgets/wishlist_action/cubit/wishlist_action_state.dart';
import 'package:bookiastoreapp/feature/wishlist/domain/reposatory/wishlist_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistActionCubit extends Cubit<DetailsState> {
  WishlistActionCubit() : super(DetailsInitial());
  Future<void> addToWishList(int productId) async {
    emit(DetailsLoadingState());
    var data = await WishlistRepo.addToWishList(productId);
    if (data != null) {
      var products = data.data?.products ?? [];
      SharedPref.cacheWishListIds(products);
      emit(DetailsSuccessState(msg: 'Added TO Wishlist'));
    } else {
      emit(DetailsErrorState());
    }
  }

 Future<void> removeFromWishlist(int productId) async {
    emit(DetailsLoadingState());
    var data = await WishlistRepo.removeFromWishList(productId);
    if (data != null) {
      var products = data.data?.products ?? [];
      SharedPref.cacheWishListIds(products);
      emit(DetailsSuccessState(msg: 'Removed From Wishlist'));
    } else {
      emit(DetailsErrorState());
    }
  }



  bool isProductInWishlist(int productId) {
    var wishlistIds = SharedPref.getWishlistIds();
    return wishlistIds.contains(productId);
  }
}
