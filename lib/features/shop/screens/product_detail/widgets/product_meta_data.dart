import 'package:flutter/material.dart';

import '/common/widgets/custom_shapes/containers/rounded_container.dart';
import '/common/widgets/images/a_circular_image.dart';
import '/common/widgets/texts/a_brand_title_text_with_verified_icon.dart';
import '/common/widgets/texts/a_product_price_text.dart';
import '/common/widgets/texts/a_product_title_text.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/enums.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/helper_functions.dart';
import '/features/shop/controllers/product/product_controller.dart';
import '/features/shop/models/product_model.dart';

class AProductMetaData extends StatelessWidget {
  const AProductMetaData({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = ProductController.instance
        .calculateSalePercentage(product.price, product.salePrice);
    final darkMode = AHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// -- Sale Tag
            if (salePercentage != null)
              Row(
                children: [
                  ARoundedContainer(
                    backgroundColor: AColors.secondary,
                    radius: ASizes.sm,
                    padding: const EdgeInsets.symmetric(
                        horizontal: ASizes.sm, vertical: ASizes.xs),
                    child: Text('$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: AColors.black)),
                  ),
                  const SizedBox(width: ASizes.spaceBtwItems)
                ],
              ),

            // Actual Price if sale price not null.
            if ((product.productVariations == null ||
                    product.productVariations!.isEmpty) &&
                product.salePrice > 0.0)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.price.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(decoration: TextDecoration.lineThrough),
                  ),
                  const SizedBox(width: ASizes.spaceBtwItems)
                ],
              ),

            // Price, Show sale price as main price if sale exist.
            AProductPriceText(
                price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(height: ASizes.spaceBtwItems / 1.5),
        AProductTitleText(title: product.title),
        const SizedBox(height: ASizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const AProductTitleText(title: 'Stock : ', smallSize: true),
            Text(controller.getProductStockStatus(product),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: ASizes.spaceBtwItems / 2),

        /// Brand
        Row(
          children: [
            ACircularImage(
              image: product.brand!.image,
              width: 32,
              height: 32,
              overlayColor: darkMode ? AColors.white : AColors.black,
            ),
            ABrandTitleWithVerifiedIcon(
                title: product.brand!.name, brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
