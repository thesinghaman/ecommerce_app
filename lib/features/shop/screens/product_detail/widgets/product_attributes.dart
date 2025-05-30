import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/widgets/chips/rounded_choice_chips.dart';
import '/common/widgets/texts/section_heading.dart';
import '/common/widgets/texts/a_product_price_text.dart';
import '/common/widgets/texts/a_product_title_text.dart';
import '/utils/constants/sizes.dart';
import '/features/shop/controllers/product/variation_controller.dart';
import '/features/shop/models/product_model.dart';

class AProductAttributes extends StatelessWidget {
  const AProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = VariationController.instance;
    controller.resetSelectedAttributes();
    return Obx(
      () => Column(
        children: [
          /// -- Selected Attribute Pricing & Description
          // Display variation price and stock when some variation is selected.
          if (controller.selectedVariation.value.id.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const ASectionHeading(
                        title: 'Variation: ', showActionButton: false),
                    const SizedBox(width: ASizes.spaceBtwItems),

                    /// Price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Actual Price if sale price not null.
                            const AProductTitleText(
                                title: 'Price : ', smallSize: true),
                            if (controller.selectedVariation.value.salePrice >
                                0)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(width: ASizes.spaceBtwItems),
                                  Text(
                                    controller.selectedVariation.value.price
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                  const SizedBox(width: ASizes.spaceBtwItems)
                                ],
                              ),
                            // Sale Price if sale price not null Else Simple Price.
                            AProductPriceText(
                              price: controller
                                          .selectedVariation.value.salePrice >
                                      0
                                  ? controller.selectedVariation.value.salePrice
                                      .toString()
                                  : controller.selectedVariation.value.price
                                      .toString(),
                            ),
                          ],
                        ),

                        /// Stock
                        Row(
                          children: [
                            const AProductTitleText(
                                title: 'Stock : ', smallSize: true),
                            Text(controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                /// Description
                AProductTitleText(
                  title:
                      controller.selectedVariation.value.description.toString(),
                  smallSize: true,
                  maxLines: 4,
                ),
              ],
            ),
          const SizedBox(height: ASizes.spaceBtwItems),

          /// -- Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      // attribute = Product Single Attribute [Name: Color, Values: [Green, Blue, Orange]]
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ASectionHeading(
                            title: attribute.name ?? '',
                            showActionButton: false),
                        const SizedBox(height: ASizes.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              // attributeValue = Single Attribute Value [Green]
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;
                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);

                              /// Attribute Chip
                              return AChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                              product,
                                              attribute.name ?? '',
                                              attributeValue);
                                        }
                                      }
                                    : null,
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: ASizes.spaceBtwItems),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
