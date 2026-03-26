import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/core/styles/text_style.dart';
import 'package:bookiastoreapp/core/widgets/dialogs.dart';
import 'package:bookiastoreapp/feature/cart/data/model/cart_response/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.item,
    this.onRemove,
    this.onUpdate,
  });

  final CartItem item;
  final Function()? onRemove;
  final Function(int)? onUpdate;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(color: AppColors.secondrycolor),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.network(
              item.itemProductImage ?? "",
              height: 120,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.itemProductName}',
                            style: TextStyles.subtitle18,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Gap(9),
                          Text(
                            '\$${item.itemProductPriceAfterDiscount}',
                            style: TextStyles.body16,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: AppColors.errorcolor),
                      onPressed: onRemove,
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        int quantity = item.itemQuantity ?? 0;
                          var updatedCount =quantity - 1;
                        if (quantity > 1) {
                          onUpdate!(updatedCount);
                        } else {
                          showMyDialog(context, 'Cnnot remove less than 1');
                        }
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text('${item.itemQuantity}'),
                    IconButton(
                      onPressed: () {
                         int quantity = item.itemQuantity ?? 0;
                        var updatedCount = quantity + 1;
                        if ((updatedCount <=
                            (item.itemProductStock ?? 0))) {
                          onUpdate!(updatedCount);
                        } else {
                          showMyDialog(context, 'Cannot add more than stock');
                        }
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
