import 'package:flutter/material.dart';

import '/common/widgets/brands/brand_show_case.dart';
import '/common/widgets/shimmers/boxes_shimmer.dart';
import '/common/widgets/shimmers/list_tile_shimmer.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/cloud_helper_functions.dart';
import '/features/shop/controllers/brand_controller.dart';
import '/features/shop/models/category_model.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: BrandController.instance.getBrandsForCategory(category.id),
      builder: (_, snapshot) {
        /// Handle Loader, No Record, OR Error Message
        const loader = Column(
          children: [
            AListTileShimmer(),
            SizedBox(height: ASizes.spaceBtwItems),
            ABoxesShimmer(),
            SizedBox(height: ASizes.spaceBtwItems),
          ],
        );
        final widget = ACloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot, loader: loader);
        if (widget != null) return widget;

        /// Record Found!
        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];

            /// Load Brand Products
            return FutureBuilder(
              future: controller.getBrandProducts(brand.id, 3),
              builder: (_, snapshot) {
                /// Handle Loader, No Record, OR Error Message
                final widget = ACloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if (widget != null) return widget;

                /// Record Found!
                final products = snapshot.data!;
                return ABrandShowcase(
                  brand: brand,
                  images: products.map((e) => e.thumbnail).toList(),
                );
              },
            );
          },
        );
      },
    );
  }
}
