import 'package:bookiastoreapp/feature/home/data/models/best_seller_book_response/best_seller_book_response.dart';
import 'package:bookiastoreapp/feature/home/data/models/best_seller_book_response/product.dart';
import 'package:bookiastoreapp/feature/home/data/models/sliders_response/slider.dart';
import 'package:bookiastoreapp/feature/home/data/models/sliders_response/sliders_response.dart';
import 'package:bookiastoreapp/feature/home/data/repo/home_repo.dart';
import 'package:bookiastoreapp/feature/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  List<Slider> sliders = [];
  List<Product> products = [];
  Future<void> initLoad() async {
    emit(HomeLoadingState());

    var responses = await Future.wait([
      HomeRepo.getSliders(),
      HomeRepo.getBestSellers(),
    ]);

    var slidersResponses = responses[0] as SlidersResponse?;
    var bestSellersResponses = responses[1] as BestSellerBookResponse?;

    if (slidersResponses != null || bestSellersResponses != null) {
      sliders = slidersResponses?.data?.sliders ?? [];
      products = bestSellersResponses?.data?.products ?? [];
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState());
    }
  }
}
