import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/common/widgets/custom_shapes/containers/rounded_container.dart';
import '/common/widgets/loaders/animation_loader.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/image_strings.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/cloud_helper_functions.dart';
import '/utils/helpers/helper_functions.dart';
import '/features/shop/controllers/product/order_controller.dart';
import '/home_menu.dart';

class AOrderListItems extends StatelessWidget {
  const AOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          /// Nothing Found Widget
          final emptyWidget = AAnimationLoaderWidget(
            text: 'Whoops! No Orders Yet!',
            animation: AImages.orderCompletedAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const HomeMenu()),
          );

          /// Helper Function: Handle Loader, No Record, OR ERROR Message
          final response = ACloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          /// Congratulations 🎊 Record found.
          final orders = snapshot.data!;
          return ListView.separated(
            shrinkWrap: true,
            itemCount: orders.length,
            separatorBuilder: (_, index) =>
                const SizedBox(height: ASizes.spaceBtwItems),
            itemBuilder: (_, index) {
              final order = orders[index];
              return ARoundedContainer(
                showBorder: true,
                backgroundColor: AHelperFunctions.isDarkMode(context)
                    ? AColors.dark
                    : AColors.light,
                child: Column(
                  children: [
                    /// -- Top Row
                    Row(
                      children: [
                        /// 1 - Image
                        const Icon(Iconsax.ship),
                        const SizedBox(width: ASizes.spaceBtwItems / 2),

                        /// 2 - Status & Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.orderStatusText,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                        color: AColors.primary,
                                        fontWeightDelta: 1),
                              ),
                              Text(order.formattedOrderDate,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            ],
                          ),
                        ),

                        /// 3 - Icon
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Iconsax.arrow_right_34,
                                size: ASizes.iconSm)),
                      ],
                    ),
                    const SizedBox(height: ASizes.spaceBtwItems),

                    /// -- Bottom Row
                    Row(
                      children: [
                        /// Order No
                        Expanded(
                          child: Row(
                            children: [
                              /// 1 - Icon
                              const Icon(Iconsax.tag),
                              const SizedBox(width: ASizes.spaceBtwItems / 2),

                              /// Order
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(
                                      order.id,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Delivery Date
                        Expanded(
                          child: Row(
                            children: [
                              /// 1 - Icon
                              const Icon(Iconsax.calendar),
                              const SizedBox(width: ASizes.spaceBtwItems / 2),

                              /// Status & Date
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Shipping Date',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(
                                      order.formattedDeliveryDate,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
