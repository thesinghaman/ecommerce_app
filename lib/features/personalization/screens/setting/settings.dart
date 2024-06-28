import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/common/widgets/appbar/appbar.dart';
import '/common/widgets/custom_shapes/containers/primary_header_container.dart';
import '/common/widgets/list_tiles/settings_menu_tile.dart';
import '/common/widgets/texts/section_heading.dart';
import '/common/widgets/list_tiles/user_profile_tile.dart';
import '/home_menu.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import '/features/shop/screens/cart/cart.dart';
import '/features/shop/screens/order/order.dart';
import '/features/personalization/controllers/user_controller.dart';
import '/features/personalization/screens/address/address.dart';
import '/features/personalization/screens/profile/profile.dart';
import 'upload_data.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return PopScope(
      canPop: false,
      // Intercept the back button press and redirect to Home Screen
      onPopInvoked: (value) async => Get.offAll(const HomeMenu()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// -- Header
              APrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// AppBar
                    AAppBar(
                        title: Text('Account',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .apply(color: AColors.white))),

                    /// User Profile Card
                    AUserProfileTile(
                        onPressed: () => Get.to(() => const ProfileScreen())),
                    const SizedBox(height: ASizes.spaceBtwSections),
                  ],
                ),
              ),

              /// -- Profile Body
              Padding(
                padding: const EdgeInsets.all(ASizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// -- Account  Settings
                    const ASectionHeading(
                        title: 'Account Settings', showActionButton: false),
                    const SizedBox(height: ASizes.spaceBtwItems),
                    ASettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subTitle: 'Set shopping delivery address',
                      onTap: () => Get.to(() => const UserAddressScreen()),
                    ),
                    ASettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout',
                      onTap: () => Get.to(() => const CartScreen()),
                    ),
                    ASettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progress and Completed Orders',
                      onTap: () => Get.to(() => const OrderScreen()),
                    ),
                    const ASettingsMenuTile(
                        icon: Iconsax.bank,
                        title: 'Bank Account',
                        subTitle:
                            'Withdraw balance to registered bank account'),
                    const ASettingsMenuTile(
                        icon: Iconsax.discount_shape,
                        title: 'My Coupons',
                        subTitle: 'List of all the discounted coupons'),
                    ASettingsMenuTile(
                        icon: Iconsax.notification,
                        title: 'Notifications',
                        subTitle: 'Set any kind of notification message',
                        onTap: () {}),
                    const ASettingsMenuTile(
                        icon: Iconsax.security_card,
                        title: 'Account Privacy',
                        subTitle: 'Manage data usage and connected accounts'),

                    /// -- App Settings
                    const SizedBox(height: ASizes.spaceBtwSections),
                    const ASectionHeading(
                        title: 'App Settings', showActionButton: false),
                    const SizedBox(height: ASizes.spaceBtwItems),
                    ASettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Firebase',
                      onTap: () => Get.to(() => const UploadDataScreen()),
                    ),
                    const SizedBox(height: ASizes.spaceBtwItems),
                    ASettingsMenuTile(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      subTitle: 'Set recommendation based on location',
                      trailing: Switch(value: true, onChanged: (value) {}),
                    ),
                    ASettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Safe Mode',
                      subTitle: 'Search result is safe for all ages',
                      trailing: Switch(value: false, onChanged: (value) {}),
                    ),
                    ASettingsMenuTile(
                      icon: Iconsax.image,
                      title: 'HD Image Quality',
                      subTitle: 'Set image quality to be seen',
                      trailing: Switch(value: false, onChanged: (value) {}),
                    ),

                    /// -- Logout Button
                    const SizedBox(height: ASizes.spaceBtwSections),
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () => controller.logout(),
                            child: const Text('Logout'))),
                    const SizedBox(height: ASizes.spaceBtwSections * 2.5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
