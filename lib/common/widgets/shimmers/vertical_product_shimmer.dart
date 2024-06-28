import 'package:flutter/material.dart';

import '/utils/constants/sizes.dart';
import '/common/widgets/layouts/grid_layout.dart';
import 'shimmer.dart';

class AVerticalProductShimmer extends StatelessWidget {
  const AVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            AShimmerEffect(width: 180, height: 180),
            SizedBox(height: ASizes.spaceBtwItems),

            /// Text
            AShimmerEffect(width: 160, height: 15),
            SizedBox(height: ASizes.spaceBtwItems / 2),
            AShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
