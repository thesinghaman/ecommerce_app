import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/features/shop/controllers/product/cart_controller.dart';
import '/features/shop/models/product_model.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/helper_functions.dart';
import 'add_remove_cart_button.dart';

class ABottomAddToCart extends StatelessWidget {
  const ABottomAddToCart({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = AHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: ASizes.defaultSpace, vertical: ASizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? AColors.darkerGrey : AColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ASizes.cardRadiusLg),
          topRight: Radius.circular(ASizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Add OR Remove Cart Product Icon Buttons
            AProductQuantityWithAddRemoveButton(
              quantity: controller.productQuantityInCart.value,
              add: () => controller.productQuantityInCart.value += 1,
              // Disable remove when cart count is less then 1
              remove: () => controller.productQuantityInCart.value < 1
                  ? null
                  : controller.productQuantityInCart.value -= 1,
            ),
            // Add to cart button
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(ASizes.md),
                backgroundColor: AColors.black,
                side: const BorderSide(color: AColors.black),
              ),
              child: const Row(
                children: [
                  Icon(Iconsax.shopping_bag),
                  SizedBox(width: ASizes.spaceBtwItems / 2),
                  Text('Add to Bag')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
