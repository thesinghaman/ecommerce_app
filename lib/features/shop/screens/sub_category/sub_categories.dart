import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/data/repositories/product/product_repository.dart';
import '/common/widgets/appbar/appbar.dart';
import '/common/widgets/images/a_rounded_image.dart';
import '/common/widgets/products/product_cards/product_card_horizontal.dart';
import '/common/widgets/shimmers/horizontal_product_shimmer.dart';
import '/common/widgets/texts/section_heading.dart';
import '/utils/constants/image_strings.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/cloud_helper_functions.dart';
import '/features/shop/controllers/categories_controller.dart';
import '/features/shop/models/category_model.dart';
import '/features/shop/screens/all_products/all_products.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: AAppBar(showBackArrow: true, title: Text(category.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const ARoundedImage(
                  width: double.infinity,
                  imageUrl: AImages.promoBanner3,
                  applyImageRadius: true),
              const SizedBox(height: ASizes.spaceBtwSections),

              /// Sub Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (_, snapshot) {
                  /// Handle Loader, No Record, OR Error Message
                  const loader = AHorizontalProductShimmer();
                  final widget = ACloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// Record found.
                  final subCategories = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      final subCategory = subCategories[index];

                      /// Fetch Category Products
                      return FutureBuilder(
                        future: controller.getCategoryProducts(
                            categoryId: subCategory.id),
                        builder: (_, snapshot) {
                          /// Handle Loader, No Record, OR Error Message
                          final widget =
                              ACloudHelperFunctions.checkMultiRecordState(
                                  snapshot: snapshot, loader: loader);
                          if (widget != null) return widget;

                          /// Congratulations 🎊 Record found.
                          final products = snapshot.data!;
                          return Column(
                            children: [
                              /// Sub Category Heading
                              ASectionHeading(
                                title: subCategory.name,
                                showActionButton: true,
                                onPressed: () => Get.to(() => AllProducts(
                                      title: subCategory.name,
                                      futureMethod: ProductRepository.instance
                                          .getProductsForCategory(
                                              categoryId: subCategory.id,
                                              limit: -1),
                                    )),
                              ),
                              const SizedBox(height: ASizes.spaceBtwItems / 2),

                              /// Sub Category Products
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: products.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                          width: ASizes.spaceBtwItems),
                                  itemBuilder: (context, index) =>
                                      AProductCardHorizontal(
                                          product: products[index]),
                                ),
                              ),
                              const SizedBox(height: ASizes.spaceBtwSections),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
