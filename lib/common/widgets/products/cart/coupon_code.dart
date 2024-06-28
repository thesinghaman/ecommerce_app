import 'package:flutter/material.dart';

import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import '/common/widgets/custom_shapes/containers/rounded_container.dart';

class ACouponCode extends StatelessWidget {
  const ACouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return ARoundedContainer(
      showBorder: true,
      backgroundColor: isDark ? AColors.dark : AColors.white,
      padding: const EdgeInsets.only(
          top: ASizes.sm, bottom: ASizes.sm, right: ASizes.sm, left: ASizes.md),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              expands: false,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Have a promo code? Enter here',
              ),
            ),
          ),

          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: isDark
                    ? AColors.white.withOpacity(0.5)
                    : AColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
