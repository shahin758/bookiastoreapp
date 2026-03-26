import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/widgets/dialogs.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/feature/details/presentation/widgets/cart_action/cubit/cart_action_cubit.dart';
import 'package:bookiastoreapp/feature/details/presentation/widgets/cart_action/cubit/cart_action_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartActionCubit(),
      child: BlocConsumer<CartActionCubit, CartActionState>(
        listener: (context, state) {
          if (state is CartActionsLoadingState) {
            showLoadingDialog(context);
          } else if (state is CartActionsSuccessState) {
            pop(context);

            showMyDialog(context, 'Added To Cart', type: DialogType.success);
          } else if (state is CartActionsErrorState) {
            pop(context);
            showMyDialog(context, 'No Books Added To Cart');
          }
        },
        builder: (context, state) {
          var cubit = context.read<CartActionCubit>();
          bool isInCart = cubit.isProductInCart(id);
          return MianButton(
            bgColor: isInCart ? AppColors.primaryColor : AppColors.darkcolor,
            minWidth: 200,
            text: isInCart ? 'Added to cart' : 'Add to cart',
            onPressed: () {
              if (!cubit.isProductInCart(id)) {
                context.read<CartActionCubit>().addToCart(id);
              }
            },
          );
        },
      ),
    );
  }
}
