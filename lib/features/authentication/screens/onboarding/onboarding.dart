import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/utils/constants/image_strings.dart';
import '/utils/constants/text_strings.dart';
import '/features/authentication/controllers/onboarding_controller.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip_button.dart';

/// Onboarding screen to introduce users to the app.
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller for managing onboarding logic and state.
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: AImages.onBoardingImage1,
                title: ATexts.onBoardingTitle1,
                subTitle: ATexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: AImages.onBoardingImage2,
                title: ATexts.onBoardingTitle2,
                subTitle: ATexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: AImages.onBoardingImage3,
                title: ATexts.onBoardingTitle3,
                subTitle: ATexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const AOnBoardingSkipButton(),

          /// Dot Navigation SmoothPageIndicator
          const AOnBoardingDotNavigation(),

          /// Circular Button
          const AOnBoardingNextButton(),
        ],
      ),
    );
  }
}
