import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookiastoreapp/feature/wishlist/presentation/widgets/wishlist_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit()..getWishList(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('WishList', style: TextStyles.title24),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: WishListBooks(),
        ),
      ),
    );
  }
}
