import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/widgets/appbar/appbar.dart';
import '/common/widgets/loaders/animation_loader.dart';
import '/utils/constants/image_strings.dart';
import '/utils/constants/sizes.dart';
import '/features/shop/controllers/product/cart_controller.dart';
import '/features/shop/screens/checkout/checkout.dart';
import 'widgets/cart_items.dart';
import '/home_menu.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final cartItems = controller.cartItems;
    return Scaffold(
      /// -- AppBar
      appBar: AAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(() {
        /// Nothing Found Widget
        final emptyWidget = AAnimationLoaderWidget(
          text: 'Whoops! Cart is EMPTY.',
          animation: AImages.cartAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const HomeMenu()),
        );

        /// Cart Items
        return cartItems.isEmpty
            ? emptyWidget
            : const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(ASizes.defaultSpace),

                  /// -- Items in Cart
                  child: ACartItems(),
                ),
              );
      }),

      /// -- Checkout Button
      bottomNavigationBar: Obx(
        () {
          return cartItems.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(ASizes.defaultSpace),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const CheckoutScreen()),
                      child: Obx(() =>
                          Text('Checkout ${controller.totalCartPrice.value}')),
                    ),
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
