import 'package:flutter/material.dart';

import '/features/shop/models/cart_item_model.dart';
import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/helper_functions.dart';
import '/common/widgets/images/a_rounded_image.dart';
import '/common/widgets/texts/a_brand_title_text_with_verified_icon.dart';
import '/common/widgets/texts/a_product_title_text.dart';

class ACartItem extends StatelessWidget {
  const ACartItem({
    super.key,
    required this.item,
  });

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// 1 - Image
        ARoundedImage(
          width: 60,
          height: 60,
          isNetworkImage: true,
          imageUrl: item.image ?? '',
          padding: const EdgeInsets.all(ASizes.sm),
          backgroundColor: dark ? AColors.darkerGrey : AColors.light,
        ),
        const SizedBox(width: ASizes.spaceBtwItems),

        /// 2 - Title, Price, & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Brand and Title
              ABrandTitleWithVerifiedIcon(title: item.brandName ?? ''),
              Flexible(
                  child: AProductTitleText(title: item.title, maxLines: 1)),

              /// Attributes
              Text.rich(
                TextSpan(
                  children: (item.selectedVariation ?? {})
                      .entries
                      .map(
                        (e) => TextSpan(
                          children: [
                            TextSpan(
                                text: ' ${e.key} ',
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: '${e.value} ',
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
