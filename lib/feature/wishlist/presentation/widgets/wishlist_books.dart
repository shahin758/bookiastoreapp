import 'package:bookiastoreapp/core/widgets/shimmer/grid_shimmer.dart';
import 'package:bookiastoreapp/feature/home/presentation/widgets/book_card.dart';
import 'package:bookiastoreapp/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookiastoreapp/feature/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListBooks extends StatelessWidget {
  const WishListBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        var cubit = context.read<WishlistCubit>();
        if (state is WishListSuccessState) {
          var books = cubit.products;
          if (books.isEmpty) {
            return const Center(child: Text('No Books in wishlist'));
          }
          return GridView.builder(
            itemCount: books.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 11,
              crossAxisSpacing: 11,
              childAspectRatio: .6,
            ),
            itemBuilder: (context, index) {
              return BookCard(
                product: books[index],
                onRemoveFromWishList: () {
                  cubit.removeFromWishList(books[index].id ?? 0);
                },
                onRefresh: () {
                  cubit.getWishList();
                },
              );
            },
          );
        } else {
          return GridShimmer(
            itemCount: 4,
            crossAxisCount: 2,
            mainAxisSpacing: 11,
            crossAxisSpacing: 11,
            childAspectRatio: 0.6,
            shrinkWrap: false,
          );
        }
      },
    );
  }
}
