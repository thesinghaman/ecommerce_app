import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/utils/device/device_utility.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import '/utils/constants/text_strings.dart';
import '/utils/helpers/helper_functions.dart';
import '/features/authentication/controllers/signup_controller.dart';

class ATermsAndConditionCheckbox extends StatelessWidget {
  const ATermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        /// CHECKBOX => Wrap in a Sized box to remove extra padding
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value = value!),
          ),
        ),
        const SizedBox(width: ASizes.md),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '${ATexts.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: ATexts.privacyPolicy,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () =>
                        ADeviceUtils.launchWebsiteUrl('https://google.com/'),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: AHelperFunctions.isDarkMode(context)
                            ? AColors.white
                            : AColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: AHelperFunctions.isDarkMode(context)
                            ? AColors.white
                            : AColors.primary,
                      ),
                ),
                TextSpan(
                    text: ' ${ATexts.and} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: ATexts.termsOfUse,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () =>
                        ADeviceUtils.launchWebsiteUrl('https://google.com/'),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: AHelperFunctions.isDarkMode(context)
                            ? AColors.white
                            : AColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: AHelperFunctions.isDarkMode(context)
                            ? AColors.white
                            : AColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
