import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/utils/constants/colors.dart';
import '/common/widgets/icons/a_circular_icon.dart';
import '/features/shop/controllers/product/favourites_controller.dart';

class AFavouriteIcon extends StatelessWidget {
  /// A custom Icon widget which handles its own logic to add or remove products from the Wishlist.
  /// You just have to call this widget on your design and pass a product id.
  ///
  /// It will auto do the logic defined in this widget.
  const AFavouriteIcon({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () => ACircularIcon(
        icon:
            controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? AColors.error : null,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}
