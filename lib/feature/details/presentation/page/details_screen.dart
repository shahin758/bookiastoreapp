import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/custome_back_button.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/feature/details/presentation/widgets/wish_list_icon.dart';
import 'package:bookiastoreapp/feature/home/data/models/best_seller_book_response/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class DetailsArg {
  final Product product;
  final String source;
  DetailsArg({required this.product, required this.source});
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.model});
  final Product model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomeBackButton(),
        actions: [WishListIcon(id: model.id ?? 0)],
      ),
    
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: model.id ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.network(
                    model.image ?? '',
                    width: 180,
                    height: 270,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gap(11),
              Text(
                model.name ?? '',
                style: TextStyles.headline30,
                textAlign: TextAlign.center,
              ),
              Gap(11),
              Text(
                model.category ?? '',
                style: TextStyles.caption212.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Gap(16),
              Text(
                model.description ?? '',
                textAlign: TextAlign.justify,
                style: TextStyles.caption212.copyWith(
                  color: AppColors.darkcolor,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${model.price} \$', style: TextStyles.title24),
            MianButton(
              bgColor: AppColors.darkcolor,
              minWidth: 200,
              text: 'Add to cart',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
