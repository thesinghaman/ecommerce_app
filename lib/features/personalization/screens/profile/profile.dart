import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/common/widgets/appbar/appbar.dart';
import '/common/widgets/images/a_circular_image.dart';
import '/common/widgets/shimmers/shimmer.dart';
import '/common/widgets/texts/section_heading.dart';
import '/utils/constants/image_strings.dart';
import '/utils/constants/sizes.dart';
import '/features/personalization/controllers/user_controller.dart';
import 'change_name.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AAppBar(
        showBackArrow: true,
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                      () {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : AImages.user;
                        return controller.imageUploading.value
                            ? const AShimmerEffect(
                                width: 80, height: 80, radius: 80)
                            : ACircularImage(
                                image: image,
                                width: 80,
                                height: 80,
                                isNetworkImage: networkImage.isNotEmpty);
                      },
                    ),
                    TextButton(
                      onPressed: controller.imageUploading.value
                          ? () {}
                          : () => controller.uploadUserProfilePicture(),
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: ASizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: ASizes.spaceBtwItems),
              const ASectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: ASizes.spaceBtwItems),
              AProfileMenu(
                  onPressed: () => Get.to(() => const ChangeName()),
                  title: 'Name',
                  value: controller.user.value.fullName),
              AProfileMenu(
                  onPressed: () {},
                  title: 'Username',
                  value: controller.user.value.username),
              const SizedBox(height: ASizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: ASizes.spaceBtwItems),
              const ASectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: ASizes.spaceBtwItems),
              AProfileMenu(
                  onPressed: () {},
                  title: 'User ID',
                  value: '45689',
                  icon: Iconsax.copy),
              AProfileMenu(
                  onPressed: () {},
                  title: 'E-mail',
                  value: controller.user.value.email),
              AProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber),
              AProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              AProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '1 Jan, 1900'),
              const Divider(),
              const SizedBox(height: ASizes.spaceBtwItems),
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text('Close Account',
                        style: TextStyle(color: Colors.red))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
