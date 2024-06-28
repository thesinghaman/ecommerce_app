import 'package:flutter/material.dart';

import '/common/widgets/shimmers/vertical_product_shimmer.dart';
import '/common/widgets/appbar/appbar.dart';
import '/common/widgets/brands/brand_card.dart';
import '/common/widgets/products/sortable/sortable_products.dart';
import '/common/widgets/texts/section_heading.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/cloud_helper_functions.dart';
import '/features/shop/controllers/brand_controller.dart';
import '/features/shop/models/brand_model.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const AAppBar(showBackArrow: true, title: Text('Brand')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              ABrandCard(brand: brand, showBorder: true),
              const SizedBox(height: ASizes.spaceBtwSections),

              /// Sub Categories
              const ASectionHeading(title: 'Products', showActionButton: false),
              const SizedBox(height: ASizes.spaceBtwItems),
              FutureBuilder(
                  future: controller.getBrandProducts(brand.id, -1),
                  builder: (context, snapshot) {
                    /// Handle Loader, No Record, OR Error Message
                    const loader = AVerticalProductShimmer();
                    final widget = ACloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Record Found!
                    final brandProducts = snapshot.data!;
                    return TSortableProducts(products: brandProducts);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
