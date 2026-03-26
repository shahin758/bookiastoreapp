import 'package:bookiastoreapp/core/constants/app_images.dart';
import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/widgets/custom_svg_picture.dart';
import 'package:bookiastoreapp/core/widgets/dialogs.dart';
import 'package:bookiastoreapp/feature/details/presentation/widgets/wishlist_action/cubit/wishlist_action_cubit.dart';
import 'package:bookiastoreapp/feature/details/presentation/widgets/wishlist_action/cubit/wishlist_action_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WishListIcon extends StatelessWidget {
  const WishListIcon({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistActionCubit(),
      child: BlocConsumer<WishlistActionCubit, DetailsState>(
        listener: (context, state) {
          if (state is DetailsLoadingState) {
            showLoadingDialog(context);
          } else if (state is DetailsSuccessState) {
            pop(context);

            showMyDialog(
              context,
              'Added To Wishlist',
              type: DialogType.success,
            );
          } else if (state is DetailsErrorState) {
            pop(context);
            showMyDialog(context, 'No Books Added To WishList');
          }
        },
        builder: (context, state) {
          var cubit = context.read<WishlistActionCubit>();
          return IconButton(
            onPressed: () {
              if (cubit.isProductInWishlist(id)) {
                cubit.removeFromWishlist(id);
              } else {
                context.read<WishlistActionCubit>().addToWishList(id);
              }
            },
            icon: cubit.isProductInWishlist(id)
                ? CustomSvgPicture(
                    path: AppImages.bookmark,
                    color: AppColors.primaryColor,
                  )
                : SvgPicture.asset(AppImages.bookmark),
          );
        },
      ),
    );
  }
}
