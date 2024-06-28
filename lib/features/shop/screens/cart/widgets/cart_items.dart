import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/widgets/products/cart/add_remove_cart_button.dart';
import '/common/widgets/products/cart/cart_item.dart';
import '/common/widgets/texts/a_product_price_text.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/helper_functions.dart';
import '/features/shop/controllers/product/cart_controller.dart';

class ACartItems extends StatelessWidget {
  const ACartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final cartItems = cartController.cartItems;
    return Obx(
      () {
        return ListView.separated(
          shrinkWrap: true,
          itemCount: cartItems.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) =>
              const SizedBox(height: ASizes.spaceBtwSections),
          itemBuilder: (context, index) {
            return Obx(
              () {
                final item = cartItems[index];
                return Column(
                  children: [
                    /// -- Cart Items
                    ACartItem(item: item),
                    if (showAddRemoveButtons)
                      const SizedBox(height: ASizes.spaceBtwItems),

                    /// -- Add Remove Buttons and Price Total
                    if (showAddRemoveButtons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// -- Add Remove Buttons
                          Row(
                            children: [
                              // Use to add space to the left of Buttons as image space.
                              const SizedBox(width: 70),

                              /// Add Remove Buttons
                              AProductQuantityWithAddRemoveButton(
                                width: 32,
                                height: 32,
                                iconSize: ASizes.md,
                                addBackgroundColor: AColors.primary,
                                removeForegroundColor:
                                    AHelperFunctions.isDarkMode(context)
                                        ? AColors.white
                                        : AColors.black,
                                removeBackgroundColor:
                                    AHelperFunctions.isDarkMode(context)
                                        ? AColors.darkerGrey
                                        : AColors.light,
                                quantity: item.quantity,
                                add: () => cartController.addOneToCart(item),
                                remove: () =>
                                    cartController.removeOneFromCart(item),
                              ),
                            ],
                          ),

                          /// -- Product total price
                          AProductPriceText(
                              price: (item.price * item.quantity)
                                  .toStringAsFixed(1)),
                        ],
                      )
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
