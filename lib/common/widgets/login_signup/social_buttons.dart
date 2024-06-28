import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/features/authentication/controllers/login_in_controller.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/image_strings.dart';
import '/utils/constants/sizes.dart';

class ASocialButtons extends StatelessWidget {
  const ASocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Google Button
        Container(
          padding: const EdgeInsets.all(ASizes.xs),
          decoration: BoxDecoration(
              border: Border.all(color: AColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
                width: ASizes.iconMd + 4,
                height: ASizes.iconMd + 4,
                image: AssetImage(AImages.google)),
          ),
        ),
        const SizedBox(width: ASizes.spaceBtwItems),

        /// Facebook Button
        Container(
          padding: const EdgeInsets.all(ASizes.xs),
          decoration: BoxDecoration(
              border: Border.all(color: AColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.facebookSignIn(),
            icon: const Image(
                width: ASizes.iconMd + 4,
                height: ASizes.iconMd + 4,
                image: AssetImage(AImages.facebook)),
          ),
        ),
      ],
    );
  }
}
