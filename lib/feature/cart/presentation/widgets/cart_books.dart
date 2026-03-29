import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/routes/routes.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/dialogs.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/core/widgets/shimmer/shimmer_widgets.dart';
import 'package:bookiastoreapp/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookiastoreapp/feature/cart/presentation/cubit/cart_state.dart';
import 'package:bookiastoreapp/feature/cart/presentation/widgets/cart_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBooks extends StatelessWidget {
  const CartBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CheckoutLoadingState) {
          showLoadingDialog(context);
        } else if (state is CheckoutSuccessState) {
          Navigator.pop(context);
          var cubit = context.read<CartCubit>();
          pushTo(context, Routes.placeOrder, extra: cubit.total);
        } else if (state is CheckoutErrorState) {
          Navigator.pop(context);
          showMyDialog(context, 'Failed to checkout. Please try again.');
        }
      },
      buildWhen: (_, state) =>
          state is CartSuccessState ||
          state is CartErrorState ||
          state is CartLoadingState,
      builder: (context, state) {
        if (state is CartSuccessState) {
          var cubit = context.read<CartCubit>();
          if (cubit.products.isEmpty) {
            return const Center(child: Text('No books in cart'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cubit.products.length,
                  itemBuilder: (context, index) {
                    return CartItemWidget(
                      item: cubit.products[index],
                      onRemove: () {
                        cubit.removeFromCart(cubit.products[index].itemId ?? 0);
                      },
                      onUpdate: (count) {
                        cubit.updateCart(
                          cubit.products[index].itemId ?? 0,
                          count,
                        );
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'total:'.tr(),
                    style: TextStyles.text20.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '\$${cubit.total}',
                    style: TextStyles.text20.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MianButton(
                  bgColor: AppColors.primaryColor,
                  text: 'checkout'.tr(),
                  textColor: AppColors.backgroundcolor,
                  onPressed: () {
                    cubit.checkout();
                  },
                ),
              ),
            ],
          );
        } else {
          return ListShimmer();
        }
      },
    );
  }
}
