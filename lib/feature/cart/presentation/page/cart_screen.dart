import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookiastoreapp/feature/cart/presentation/widgets/cart_books.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('add_to_cart'.tr(), style: TextStyles.title24),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: CartBooks(),
        ),
      ),
    );
  }
}
