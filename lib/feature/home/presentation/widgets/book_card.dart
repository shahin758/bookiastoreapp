import 'package:bookiastoreapp/core/functions/navigation.dart';
import 'package:bookiastoreapp/core/routes/routes.dart';
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/mian_button.dart';
import 'package:bookiastoreapp/feature/home/data/models/best_seller_book_response/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.product,
    this.onRemoveFromWishList,
    this.onRefresh,
  });
  final Product product;
  final Function()? onRemoveFromWishList;
  final Function()? onRefresh;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, Routes.detailsscreen, extra: product).then((value) {
          onRefresh?.call();
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondrycolor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: product.id ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.image ?? '',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Gap(10),
            SizedBox(
              height: 45,
              child: Text(
                product.name ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.body16,
              ),
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.priceAfterDiscount ?? product.price}',
                  style: TextStyles.body16,
                ),
                onRemoveFromWishList != null
                    ? IconButton(
                        onPressed: onRemoveFromWishList,
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(30, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        icon: const Icon(
                          Icons.delete,
                          color: AppColors.errorcolor,
                        ),
                      )
                    : SizedBox(
                        height: 30,
                        child: MianButton(
                          minWidth: 70,
                          minHeight: 30,
                          bgColor: AppColors.darkcolor,
                          text: 'Buy',
                          onPressed: () {},
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
