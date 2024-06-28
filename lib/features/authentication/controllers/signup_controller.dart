import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/data/repositories/authentication/authentication_repository.dart';
import '/utils/constants/image_strings.dart';
import '/utils/helpers/network_manager.dart';
import '/utils/popups/full_screen_loader.dart';
import '/utils/popups/loaders.dart';
import '/features/personalization/controllers/user_controller.dart';
import '/features/personalization/models/user_model.dart';
import '/features/authentication/screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  /// -- SIGNUP
  Future<void> signup() async {
    try {
      // Start Loading
      AFullScreenLoader.openLoadingDialog(
          'We are processing your information...', AImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        AFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        AFullScreenLoader.stopLoading();
        ALoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.');
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      await AuthenticationRepository.instance.registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: AuthenticationRepository.instance.getUserID,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      await UserController.instance.saveUserRecord(user: newUser);

      // Remove Loader
      AFullScreenLoader.stopLoading();

      // Show Success Message
      ALoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');

      // Move to Verify Email Screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      // Show some Generic Error to the user
      AFullScreenLoader.stopLoading();
      ALoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
