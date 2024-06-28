import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/widgets/appbar/appbar.dart';
import '/utils/constants/image_strings.dart';
import '/utils/constants/sizes.dart';
import '/utils/constants/text_strings.dart';
import '/utils/helpers/helper_functions.dart';
import '/features/authentication/controllers/forget_password_controller.dart';
import '/features/authentication/screens//login/login.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      /// Appbar to go back OR close all screens and Goto LoginScreen()
      appBar: AAppBar(
        actions: [
          IconButton(
              onPressed: () => Get.offAll(const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Column(
            children: [
              /// Image with 60% of screen width
              Image(
                image: const AssetImage(AImages.deliveredEmailIllustration),
                width: AHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: ASizes.spaceBtwSections),

              /// Title & SubTitle
              Text(ATexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: ASizes.spaceBtwItems),
              Text(email,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: ASizes.spaceBtwItems),
              Text(
                ATexts.changeYourPasswordSubTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: ASizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.offAll(() => const LoginScreen()),
                      child: const Text(ATexts.done))),
              const SizedBox(height: ASizes.spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () =>
                          controller.resendPasswordResetEmail(email),
                      child: const Text(ATexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
