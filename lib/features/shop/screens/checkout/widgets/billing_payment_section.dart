import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/common/widgets/custom_shapes/containers/rounded_container.dart';
import '/common/widgets/texts/section_heading.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/helper_functions.dart';
import '/features/shop/controllers/checkout_controller.dart';

class ABillingPaymentSection extends StatelessWidget {
  const ABillingPaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return Column(
      children: [
        ASectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: () {
            controller.selectPaymentMethod(context);
          },
        ),
        const SizedBox(height: ASizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              ARoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: AHelperFunctions.isDarkMode(context)
                    ? AColors.light
                    : AColors.white,
                padding: const EdgeInsets.all(ASizes.sm),
                child: Image(
                    image: AssetImage(
                        controller.selectedPaymentMethod.value.image),
                    fit: BoxFit.contain),
              ),
              const SizedBox(width: ASizes.spaceBtwItems / 2),
              Text(controller.selectedPaymentMethod.value.name,
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}
