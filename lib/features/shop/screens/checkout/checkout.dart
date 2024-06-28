import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/widgets/appbar/appbar.dart';
import '/common/widgets/custom_shapes/containers/rounded_container.dart';
import '/common/widgets/products/cart/billing_amount_section.dart';
import '/common/widgets/products/cart/coupon_code.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/helper_functions.dart';
import '/utils/helpers/pricing_calculator.dart';
import '/utils/popups/loaders.dart';
import '/features/shop/controllers/product/cart_controller.dart';
import '/features/shop/controllers/product/order_controller.dart';
import '/features/shop/screens/cart/widgets/cart_items.dart';
import 'widgets/billing_address_section.dart';
import 'widgets/billing_payment_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = APricingCalculator.calculateTotalPrice(subTotal, 'US');
    final dark = AHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const AAppBar(title: Text('Order Review'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// -- Items in Cart
              const ACartItems(showAddRemoveButtons: false),
              const SizedBox(height: ASizes.spaceBtwSections),

              /// -- Coupon TextField
              const ACouponCode(),
              const SizedBox(height: ASizes.spaceBtwSections),

              /// -- Billing Section
              ARoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(ASizes.md),
                backgroundColor: dark ? AColors.black : AColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    ABillingAmountSection(subTotal: subTotal),
                    const SizedBox(height: ASizes.spaceBtwItems),

                    /// Divider
                    const Divider(),
                    const SizedBox(height: ASizes.spaceBtwItems),

                    /// Payment Methods
                    const ABillingPaymentSection(),
                    const SizedBox(height: ASizes.spaceBtwSections),

                    /// Address
                    const ABillingAddressSection(),
                  ],
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwSections),
            ],
          ),
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ASizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: subTotal > 0
                ? () => orderController.processOrder(totalAmount)
                : () => ALoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add items in the cart in order to proceed.'),
            child: Text('Checkout \$$totalAmount'),
          ),
        ),
      ),
    );
  }
}
