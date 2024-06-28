import 'package:flutter/material.dart';

import '/utils/constants/sizes.dart';
import '/utils/device/device_utility.dart';
import '/features/authentication/controllers/onboarding_controller.dart';

class AOnBoardingSkipButton extends StatelessWidget {
  const AOnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      top: ADeviceUtils.getAppBarHeight(),
      right: ASizes.defaultSpace,
      child:
          TextButton(onPressed: controller.skipPage, child: const Text('Skip')),
    );
  }
}
