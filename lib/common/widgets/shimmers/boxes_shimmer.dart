import 'package:flutter/material.dart';

import 'shimmer.dart';
import '/utils/constants/sizes.dart';

class ABoxesShimmer extends StatelessWidget {
  const ABoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: AShimmerEffect(width: 150, height: 110)),
            SizedBox(width: ASizes.spaceBtwItems),
            Expanded(child: AShimmerEffect(width: 150, height: 110)),
            SizedBox(width: ASizes.spaceBtwItems),
            Expanded(child: AShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
