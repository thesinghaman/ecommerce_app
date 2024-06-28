import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/features/shop/models/brand_model.dart';
import '/features/shop/screens/brand/brand.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/helper_functions.dart';
import '/common/widgets/custom_shapes/containers/rounded_container.dart';
import '/common/widgets/shimmers/shimmer.dart';
import 'brand_card.dart';

/// A widget showcasing a brand with its top 3 product images.
class ABrandShowcase extends StatelessWidget {
  /// Default constructor for the TBrandShowcase.
  ///
  /// Parameters:
  ///   - brand: The brand model to display.
  ///   - images: The list of top 3 product images for the brand.
  const ABrandShowcase({super.key, required this.brand, required this.images});

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(BrandScreen(brand: brand)),
      child: ARoundedContainer(
        margin: const EdgeInsets.only(bottom: ASizes.spaceBtwItems),
        showBorder: true,
        borderColor: AColors.darkGrey,
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            /// Brand with Products Count
            ABrandCard(showBorder: false, brand: brand),
            const SizedBox(height: ASizes.spaceBtwItems / 2),

            /// Brand Top 3 Product Images
            Row(
                children: images
                    .map((e) => brandTopProductImageWidget(e, context))
                    .toList()),
          ],
        ),
      ),
    );
  }

  /// Widget to display a top product image for the brand.
  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: ARoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(ASizes.md),
        margin: const EdgeInsets.only(right: ASizes.sm),
        backgroundColor: AHelperFunctions.isDarkMode(context)
            ? AColors.darkerGrey
            : AColors.light,
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const AShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
