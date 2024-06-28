import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/widgets/appbar/appbar.dart';
import '/common/widgets/login_signup/form_divider.dart';
import '/common/widgets/login_signup/social_buttons.dart';
import '/utils/constants/sizes.dart';
import '/utils/constants/text_strings.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///  Title
              Text(ATexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),

              /// Form
              const ASignupForm(),
              const SizedBox(height: ASizes.spaceBtwSections),

              /// Divider
              AFormDivider(dividerText: ATexts.orSignUpWith.capitalize!),
              const SizedBox(height: ASizes.spaceBtwSections),

              /// Social Buttons
              const ASocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
