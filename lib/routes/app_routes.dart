import 'package:get/get_navigation/src/routes/get_route.dart';

import '/features/authentication/screens/login/login.dart';
import '/features/authentication/screens/password_configuration/forget_password.dart';
import '/features/authentication/screens/onboarding/onboarding.dart';
import '/features/authentication/screens/signup/signup.dart';
import '/features/authentication/screens/signup/verify_email.dart';
import '/features/personalization/screens/address/address.dart';
import '/features/personalization/screens/profile/profile.dart';
import '/features/personalization/screens/setting/settings.dart';
import '/features/shop/screens/cart/cart.dart';
import '/features/shop/screens/checkout/checkout.dart';
import '/features/shop/screens/favourites/favourite.dart';
import '/features/shop/screens/home/home.dart';
import '/features/shop/screens/order/order.dart';
import '/features/shop/screens/product_reviews/product_reviews.dart';
import '/features/shop/screens/search/search.dart';
import '/features/shop/screens/store/store.dart';
import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: ARoutes.home, page: () => const HomeScreen()),
    GetPage(name: ARoutes.store, page: () => const StoreScreen()),
    GetPage(name: ARoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: ARoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: ARoutes.search, page: () => SearchScreen()),
    GetPage(
        name: ARoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: ARoutes.order, page: () => const OrderScreen()),
    GetPage(name: ARoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: ARoutes.cart, page: () => const CartScreen()),
    GetPage(name: ARoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: ARoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: ARoutes.signup, page: () => const SignupScreen()),
    GetPage(name: ARoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: ARoutes.signIn, page: () => const LoginScreen()),
    GetPage(
        name: ARoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: ARoutes.onBoarding, page: () => const OnBoardingScreen()),
    // Add more GetPage entries as needed
  ];
}
