import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/widgets/appbar/appbar.dart';
import '/common/widgets/brands/brand_card.dart';
import '/common/widgets/layouts/grid_layout.dart';
import '/common/widgets/shimmers/brands_shimmer.dart';
import '/common/widgets/texts/section_heading.dart';
import '/utils/constants/sizes.dart';
import '/features/shop/controllers/brand_controller.dart';
import 'brand.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

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
              /// Sub Categories
              const ASectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: ASizes.spaceBtwItems),

              /// -- Brands
              Obx(
                () {
                  // Check if categories are still loading
                  if (controller.isLoading.value) return const ABrandsShimmer();

                  // Check if there are no featured categories found
                  if (controller.allBrands.isEmpty) {
                    return Center(
                        child: Text('No Data Found!',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: Colors.white)));
                  } else {
                    /// Data Found
                    return AGridLayout(
                      itemCount: controller.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brand = controller.allBrands[index];
                        return ABrandCard(
                          brand: brand,
                          showBorder: true,
                          onTap: () => Get.to(() => BrandScreen(brand: brand)),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
