import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '/common/widgets/products/cart/bottom_add_to_cart_widget.dart';
import '/common/widgets/texts/section_heading.dart';
import '/utils/constants/sizes.dart';
import '/utils/device/device_utility.dart';
import '/features/shop/models/product_model.dart';
import '/features/shop/screens/checkout/checkout.dart';
import '/features/shop/screens/product_reviews/product_reviews.dart';
import 'widgets/product_attributes.dart';
import 'widgets/product_detail_image_slider.dart';
import 'widgets/product_meta_data.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 1 - Product Image Slider
            AProductImageSlider(product: product),

            /// 2 - Product Details
            Container(
              padding: const EdgeInsets.only(
                  right: ASizes.defaultSpace,
                  left: ASizes.defaultSpace,
                  bottom: ASizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// - Rating & Share
                  const ARatingAndShare(),

                  /// - Price, Title, Stock, & Brand
                  AProductMetaData(product: product),
                  const SizedBox(height: ASizes.spaceBtwSections / 2),

                  /// -- Attributes
                  // If Product has no variations do not show attributes as well.
                  if (product.productVariations != null &&
                      product.productVariations!.isNotEmpty)
                    AProductAttributes(product: product),
                  if (product.productVariations != null &&
                      product.productVariations!.isNotEmpty)
                    const SizedBox(height: ASizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                    width: ADeviceUtils.getScreenWidth(context),
                    child: ElevatedButton(
                        child: const Text('Checkout'),
                        onPressed: () => Get.to(() => const CheckoutScreen())),
                  ),
                  const SizedBox(height: ASizes.spaceBtwSections),

                  /// - Description
                  const ASectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: ASizes.spaceBtwItems),
                  // Read more package
                  ReadMoreText(
                    product.description!,
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: ASizes.spaceBtwSections),

                  /// - Reviews
                  const Divider(),
                  const SizedBox(height: ASizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ASectionHeading(
                          title: 'Reviews (199)', showActionButton: false),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed: () => Get.to(
                            () => const ProductReviewsScreen(),
                            fullscreenDialog: true),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ABottomAddToCart(product: product),
    );
  }
}
