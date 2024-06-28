import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/common/widgets/appbar/appbar.dart';
import '/common/widgets/icons/a_circular_icon.dart';
import '/common/widgets/layouts/grid_layout.dart';
import '/common/widgets/loaders/animation_loader.dart';
import '/common/widgets/products/product_cards/product_card_vertical.dart';
import '/common/widgets/shimmers/vertical_product_shimmer.dart';
import '/utils/constants/image_strings.dart';
import '/utils/constants/sizes.dart';
import '/utils/device/device_utility.dart';
import '/utils/helpers/cloud_helper_functions.dart';
import '/features/shop/controllers/product/favourites_controller.dart';
import '/features/shop/screens/store/store.dart';
import '/home_menu.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // Intercept the back button press and redirect to Home Screen
      onPopInvoked: (value) async => Get.offAll(const HomeMenu()),
      child: Scaffold(
        appBar: AAppBar(
          title: Text('Wishlist',
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            ACircularIcon(
                icon: Iconsax.add,
                onPressed: () => Get.to(() => const StoreScreen()))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(ASizes.defaultSpace),
            child: Column(
              children: [
                /// Products Grid
                Obx(() {
                  return FutureBuilder(
                    future: FavouritesController.instance.favoriteProducts(),
                    builder: (_, snapshot) {
                      /// Nothing Found Widget
                      final emptyWidget = AAnimationLoaderWidget(
                        text: 'Whoops! Wishlist is Empty...',
                        animation: AImages.pencilAnimation,
                        showAction: true,
                        actionText: 'Let\'s add some',
                        onActionPressed: () => Get.off(() => const HomeMenu()),
                      );
                      const loader = AVerticalProductShimmer(itemCount: 6);
                      final widget =
                          ACloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: loader,
                              nothingFound: emptyWidget);
                      if (widget != null) return widget;

                      final products = snapshot.data!;
                      return AGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) =>
                            AProductCardVertical(product: products[index]),
                      );
                    },
                  );
                }),
                SizedBox(
                    height: ADeviceUtils.getBottomNavigationBarHeight() +
                        ASizes.defaultSpace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
