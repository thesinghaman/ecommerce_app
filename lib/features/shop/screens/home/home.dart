import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/widgets/custom_shapes/containers/primary_header_container.dart';
import '/common/widgets/layouts/grid_layout.dart';
import '/common/widgets/products/product_cards/product_card_vertical.dart';
import '/common/widgets/shimmers/vertical_product_shimmer.dart';
import '/common/widgets/texts/section_heading.dart';
import '/data/repositories/product/product_repository.dart';
import '/utils/constants/sizes.dart';
import '/utils/constants/text_strings.dart';
import '/utils/device/device_utility.dart';
import '/features/shop/controllers/product/product_controller.dart';
import '/features/shop/screens/all_products/all_products.dart';
import 'widgets/header_categories.dart';
import 'widgets/header_search_container.dart';
import 'widgets/home_appbar.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const APrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Appbar
                  AHomeAppBar(),
                  SizedBox(height: ASizes.spaceBtwSections),

                  /// -- Searchbar
                  ASearchContainer(text: 'Search in Store', showBorder: false),
                  SizedBox(height: ASizes.spaceBtwSections),

                  /// -- Categories
                  AHeaderCategories(),
                  SizedBox(height: ASizes.spaceBtwSections * 2),
                ],
              ),
            ),

            /// -- Body
            Container(
              padding: const EdgeInsets.all(ASizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Promo Slider 1
                  const TPromoSlider(),
                  const SizedBox(height: ASizes.spaceBtwSections),

                  /// -- Products Heading
                  ASectionHeading(
                    title: ATexts.popularProducts,
                    onPressed: () => Get.to(
                      () => AllProducts(
                        title: ATexts.popularProducts,
                        futureMethod:
                            ProductRepository.instance.getAllFeaturedProducts(),
                      ),
                    ),
                  ),
                  const SizedBox(height: ASizes.spaceBtwItems),

                  /// Products Section
                  Obx(
                    () {
                      // Display loader while products are loading
                      if (controller.isLoading.value) {
                        return const AVerticalProductShimmer();
                      }

                      // Check if no featured products are found
                      if (controller.featuredProducts.isEmpty) {
                        return Center(
                            child: Text('No Data Found!',
                                style: Theme.of(context).textTheme.bodyMedium));
                      } else {
                        // Featured Products Found! 🎊
                        return AGridLayout(
                          itemCount: controller.featuredProducts.length,
                          itemBuilder: (_, index) => AProductCardVertical(
                              product: controller.featuredProducts[index],
                              isNetworkImage: true),
                        );
                      }
                    },
                  ),

                  SizedBox(
                      height: ADeviceUtils.getBottomNavigationBarHeight() +
                          ASizes.defaultSpace),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
