import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import '/common/widgets/icons/a_circular_icon.dart';

class AProductQuantityWithAddRemoveButton extends StatelessWidget {
  const AProductQuantityWithAddRemoveButton({
    super.key,
    required this.add,
    this.width = 40,
    this.height = 40,
    this.iconSize,
    required this.remove,
    required this.quantity,
    this.addBackgroundColor = AColors.black,
    this.removeBackgroundColor = AColors.darkGrey,
    this.addForegroundColor = AColors.white,
    this.removeForegroundColor = AColors.white,
  });

  final VoidCallback? add, remove;
  final int quantity;
  final double width, height;
  final double? iconSize;
  final Color addBackgroundColor, removeBackgroundColor;
  final Color addForegroundColor, removeForegroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ACircularIcon(
          icon: Iconsax.minus,
          onPressed: remove,
          width: width,
          height: height,
          size: iconSize,
          color: removeForegroundColor,
          backgroundColor: removeBackgroundColor,
        ),
        const SizedBox(width: ASizes.spaceBtwItems),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: ASizes.spaceBtwItems),
        ACircularIcon(
          icon: Iconsax.add,
          onPressed: add,
          width: width,
          height: height,
          size: iconSize,
          color: addForegroundColor,
          backgroundColor: addBackgroundColor,
        ),
      ],
    );
  }
}
