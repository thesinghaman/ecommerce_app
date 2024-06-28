import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/features/shop/controllers/product/product_controller.dart';
import '/features/shop/models/product_model.dart';
import '/features/shop/screens/product_detail/product_detail.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/enums.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/helper_functions.dart';
import '/common/widgets/custom_shapes/containers/rounded_container.dart';
import '/common/widgets/images/a_rounded_image.dart';
import '/common/widgets/texts/a_brand_title_text_with_verified_icon.dart';
import '/common/widgets/texts/a_product_title_text.dart';
import '/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'widgets/add_to_cart_button.dart';
import 'widgets/product_card_pricing_widget.dart';
import 'widgets/product_sale_tag.dart';

class AProductCardHorizontal extends StatelessWidget {
  const AProductCardHorizontal(
      {super.key, required this.product, this.isNetworkImage = true});

  final ProductModel product;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final salePercentage = ProductController.instance
        .calculateSalePercentage(product.price, product.salePrice);
    final isDark = AHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),

      /// Container with side paddings, color, edges, radius and shadow.
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ASizes.productImageRadius),
          color: AHelperFunctions.isDarkMode(context)
              ? AColors.darkerGrey
              : AColors.lightContainer,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail
            ARoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(ASizes.sm),
              backgroundColor: isDark ? AColors.dark : AColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  ARoundedImage(
                      width: 120,
                      height: 120,
                      imageUrl: product.thumbnail,
                      isNetworkImage: isNetworkImage),

                  /// -- Sale Tag
                  if (salePercentage != null)
                    ProductSaleTagWidget(salePercentage: salePercentage),

                  /// -- Favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: AFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ASizes.spaceBtwItems / 2),

            /// -- Details, Add to Cart, & Pricing
            Container(
              padding: const EdgeInsets.only(left: ASizes.sm),
              width: 172,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Details
                  Padding(
                    padding: const EdgeInsets.only(top: ASizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AProductTitleText(
                          title: product.title,
                          smallSize: true,
                          maxLines: 2,
                        ),
                        const SizedBox(height: ASizes.spaceBtwItems / 2),
                        ABrandTitleWithVerifiedIcon(
                            title: product.brand!.name,
                            brandTextSize: TextSizes.small),
                      ],
                    ),
                  ),

                  /// Price & Add to cart button
                  /// Use Spacer() to utilize all the space and set the price and cart button at the bottom.
                  /// This usually happens when Product title is in single line or 2 lines (Max)
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      PricingWidget(product: product),

                      /// Add to cart
                      ProductCardAddToCartButton(product: product),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
