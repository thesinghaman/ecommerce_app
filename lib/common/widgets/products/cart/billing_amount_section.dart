import 'package:flutter/material.dart';

import '/utils/constants/sizes.dart';
import '/utils/helpers/pricing_calculator.dart';

class ABillingAmountSection extends StatelessWidget {
  const ABillingAmountSection({super.key, required this.subTotal});

  final double subTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// -- Sub Total
        Row(
          children: [
            Expanded(
                child: Text('Subtotal',
                    style: Theme.of(context).textTheme.bodyMedium)),
            Text('\$$subTotal', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ASizes.spaceBtwItems / 2),

        /// -- Shipping Fee
        Row(
          children: [
            Expanded(
                child: Text('Shipping Fee',
                    style: Theme.of(context).textTheme.bodyMedium)),
            Text(
              '\$${APricingCalculator.calculateShippingCost(subTotal, 'US')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: ASizes.spaceBtwItems / 2),

        /// -- Tax Fee
        Row(
          children: [
            Expanded(
                child: Text('Tax Fee',
                    style: Theme.of(context).textTheme.bodyMedium)),
            Text(
              '\$${APricingCalculator.calculateTax(subTotal, 'US')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: ASizes.spaceBtwItems),

        /// -- Order Total
        Row(
          children: [
            Expanded(
                child: Text('Order Total',
                    style: Theme.of(context).textTheme.titleMedium)),
            Text('\$${APricingCalculator.calculateTotalPrice(subTotal, 'US')}',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
