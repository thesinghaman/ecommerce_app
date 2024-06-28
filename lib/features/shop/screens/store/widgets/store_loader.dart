import 'package:flutter/material.dart';

import '/common/widgets/shimmers/boxes_shimmer.dart';
import '/common/widgets/shimmers/brands_shimmer.dart';
import '/common/widgets/shimmers/list_tile_shimmer.dart';
import '/common/widgets/shimmers/shimmer.dart';
import '/common/widgets/shimmers/vertical_product_shimmer.dart';
import '/utils/constants/sizes.dart';

class AStoreShimmerLoader extends StatelessWidget {
  const AStoreShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(ASizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(height: ASizes.spaceBtwSections),
            // AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AShimmerEffect(width: 100, height: 15),
                AShimmerEffect(width: 55, height: 55, radius: 55),
              ],
            ),
            SizedBox(height: ASizes.spaceBtwSections * 2),
            // Search
            AShimmerEffect(width: double.infinity, height: 55),
            SizedBox(height: ASizes.spaceBtwSections),

            // Heading
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AShimmerEffect(width: 100, height: 15),
                AShimmerEffect(width: 80, height: 12),
              ],
            ),
            SizedBox(height: ASizes.spaceBtwSections),

            // Brands
            ABrandsShimmer(),
            SizedBox(height: ASizes.spaceBtwSections * 2),

            // Categories
            Row(
              children: [
                Expanded(child: AShimmerEffect(width: 100, height: 15)),
                SizedBox(width: ASizes.spaceBtwItems),
                Expanded(child: AShimmerEffect(width: 100, height: 15)),
                SizedBox(width: ASizes.spaceBtwItems),
                Expanded(child: AShimmerEffect(width: 100, height: 15)),
                SizedBox(width: ASizes.spaceBtwItems),
                Expanded(child: AShimmerEffect(width: 100, height: 15)),
              ],
            ),
            SizedBox(height: ASizes.spaceBtwSections),

            // Category Brands
            AListTileShimmer(),
            SizedBox(height: ASizes.spaceBtwSections),
            ABoxesShimmer(),
            SizedBox(height: ASizes.spaceBtwSections),

            // Products
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AShimmerEffect(width: 100, height: 15),
                AShimmerEffect(width: 80, height: 12),
              ],
            ),
            SizedBox(height: ASizes.spaceBtwSections),

            AVerticalProductShimmer(),
            SizedBox(height: ASizes.spaceBtwSections * 3),
          ],
        ),
      ),
    );
  }
}
