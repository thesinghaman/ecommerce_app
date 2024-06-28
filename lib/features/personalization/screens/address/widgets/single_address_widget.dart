import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/common/widgets/custom_shapes/containers/rounded_container.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/helper_functions.dart';
import '/features/personalization/controllers/address_controller.dart';
import '/features/personalization/models/address_model.dart';

class ASingleAddress extends StatelessWidget {
  const ASingleAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = AHelperFunctions.isDarkMode(context);
    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final isAddressSelected = selectedAddressId == address.id;
        return GestureDetector(
          onTap: onTap,
          child: ARoundedContainer(
            showBorder: true,
            padding: const EdgeInsets.all(ASizes.md),
            width: double.infinity,
            backgroundColor: isAddressSelected
                ? AColors.primary.withOpacity(0.5)
                : Colors.transparent,
            borderColor: isAddressSelected
                ? Colors.transparent
                : dark
                    ? AColors.darkerGrey
                    : AColors.grey,
            margin: const EdgeInsets.only(bottom: ASizes.spaceBtwItems),
            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  top: 0,
                  child: Icon(
                    isAddressSelected
                        ? Iconsax.tick_circle1
                        : Iconsax.tick_circle1,
                    color: isAddressSelected
                        ? AColors.primary
                        : dark
                            ? AColors.darkerGrey
                            : AColors.grey,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: ASizes.sm / 2),
                    Text(address.formattedPhoneNo,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: ASizes.sm / 2),
                    Text(address.toString(), softWrap: true),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
