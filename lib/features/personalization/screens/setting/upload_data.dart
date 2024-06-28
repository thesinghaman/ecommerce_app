import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/common/widgets/appbar/appbar.dart';
import '/common/widgets/texts/section_heading.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import '/features/personalization/controllers/upload_data_controller.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadDataController());
    return Scaffold(
      appBar: const AAppBar(title: Text('Upload Data'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Profile Body
            Padding(
              padding: const EdgeInsets.all(ASizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ASectionHeading(
                      title: 'Main Record', showActionButton: false),
                  const SizedBox(height: ASizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.category,
                        size: 28, color: AColors.primary),
                    title: Text('Upload Categories',
                        style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadCategories(),
                      icon: const Icon(Iconsax.arrow_up_1,
                          size: 28, color: AColors.primary),
                    ),
                  ),
                  const SizedBox(height: ASizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.shop,
                        size: 28, color: AColors.primary),
                    title: Text('Upload Brands',
                        style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadBrands(),
                      icon: const Icon(Iconsax.arrow_up_1,
                          size: 28, color: AColors.primary),
                    ),
                  ),
                  const SizedBox(height: ASizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.shopping_cart,
                        size: 28, color: AColors.primary),
                    title: Text('Upload Products',
                        style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadProducts(),
                      icon: const Icon(Iconsax.arrow_up_1,
                          size: 28, color: AColors.primary),
                    ),
                  ),
                  const SizedBox(height: ASizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.image,
                        size: 28, color: AColors.primary),
                    title: Text('Upload Banners',
                        style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadBanners(),
                      icon: const Icon(Iconsax.arrow_up_1,
                          size: 28, color: AColors.primary),
                    ),
                  ),
                  const SizedBox(height: ASizes.spaceBtwSections),
                  const ASectionHeading(
                      title: 'Relationships', showActionButton: false),
                  const Text(
                      'Make sure you have already uploaded all the content above.'),
                  const SizedBox(height: ASizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.link,
                        size: 28, color: AColors.primary),
                    title: Text('Upload Brands & Categories Relation Data',
                        style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadBrandCategory(),
                      icon: const Icon(Iconsax.arrow_up_1,
                          size: 28, color: AColors.primary),
                    ),
                  ),
                  const SizedBox(height: ASizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.link,
                        size: 28, color: AColors.primary),
                    title: Text('Upload Product Categories Relational Data',
                        style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadProductCategories(),
                      icon: const Icon(Iconsax.arrow_up_1,
                          size: 28, color: AColors.primary),
                    ),
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
