import 'package:flutter/material.dart';

import '/utils/constants/sizes.dart';
import 'shimmer.dart';

class ASearchCategoryShimmer extends StatelessWidget {
  const ASearchCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        separatorBuilder: (_, __) =>
            const SizedBox(width: ASizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              AShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: ASizes.spaceBtwItems / 2),

              /// Text
              AShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
