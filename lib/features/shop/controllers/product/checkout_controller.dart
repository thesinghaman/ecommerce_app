import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/widgets/texts/section_heading.dart';
import '/utils/constants/image_strings.dart';
import '/utils/constants/sizes.dart';
import '/features/shop/models/payment_method_model.dart';
import '/features/shop/screens/checkout/widgets/payment_tile.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: AImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(ASizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ASectionHeading(title: 'Select Payment Method'),
              const SizedBox(height: ASizes.spaceBtwSections),
              APaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paypal', image: AImages.paypal)),
              const SizedBox(height: ASizes.spaceBtwItems / 2),
              APaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Google Pay', image: AImages.googlePay)),
              const SizedBox(height: ASizes.spaceBtwItems / 2),
              APaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Apple Pay', image: AImages.applePay)),
              const SizedBox(height: ASizes.spaceBtwItems / 2),
              APaymentTile(
                  paymentMethod:
                      PaymentMethodModel(name: 'VISA', image: AImages.visa)),
              const SizedBox(height: ASizes.spaceBtwItems / 2),
              APaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Master Card', image: AImages.masterCard)),
              const SizedBox(height: ASizes.spaceBtwItems / 2),
              APaymentTile(
                  paymentMethod:
                      PaymentMethodModel(name: 'Paytm', image: AImages.paytm)),
              const SizedBox(height: ASizes.spaceBtwItems / 2),
              APaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Paystack', image: AImages.paystack)),
              const SizedBox(height: ASizes.spaceBtwItems / 2),
              APaymentTile(
                  paymentMethod: PaymentMethodModel(
                      name: 'Credit Card', image: AImages.creditCard)),
              const SizedBox(height: ASizes.spaceBtwItems / 2),
              const SizedBox(height: ASizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
