import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/widgets/appbar/appbar.dart';
import '/common/widgets/products/cart/cart_menu_icon.dart';
import '/common/widgets/shimmers/shimmer.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/text_strings.dart';
import '/features/personalization/controllers/user_controller.dart';
import '/features/personalization/screens/profile/profile.dart';

class AHomeAppBar extends StatelessWidget {
  const AHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return AAppBar(
      title: GestureDetector(
        onTap: () => Get.to(() => const ProfileScreen()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ATexts.homeAppbarTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: AColors.grey)),
            Obx(
              () {
                // Check if user Profile is still loading
                if (userController.profileLoading.value) {
                  // Display a shimmer loader while user profile is being loaded
                  return const AShimmerEffect(width: 80, height: 15);
                } else {
                  // Check if there are no record found
                  if (userController.user.value.id.isEmpty) {
                    // Display a message when no data is found
                    return Text(
                      'Your Name',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: AColors.white),
                    );
                  } else {
                    // Display User Name
                    return Text(
                      userController.user.value.fullName,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: AColors.white),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
      actions: const [
        ACartCounterIcon(
            iconColor: AColors.white,
            counterBgColor: AColors.black,
            counterTextColor: AColors.white)
      ],
    );
  }
}
