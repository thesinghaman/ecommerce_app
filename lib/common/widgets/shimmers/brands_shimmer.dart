import 'package:flutter/material.dart';

import '/common/widgets/layouts/grid_layout.dart';
import 'shimmer.dart';

class ABrandsShimmer extends StatelessWidget {
  const ABrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return AGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const AShimmerEffect(width: 300, height: 80),
    );
  }
}
