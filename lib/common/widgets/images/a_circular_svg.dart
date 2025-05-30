import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';

class ACircularSvg extends StatelessWidget {
  const ACircularSvg({
    super.key,
    this.width = 56,
    this.height = 56,
    required this.svg,
    this.imageOverlayColor,
    this.imageBackgroundColor = AColors.light,
  });

  final String svg;
  final double width, height;
  final Color? imageOverlayColor;
  final Color imageBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(ASizes.xs),
      decoration: BoxDecoration(
          color: imageBackgroundColor,
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ASizes.productImageRadius),
        child: SvgPicture.asset(svg, fit: BoxFit.fill),
      ),
    );
  }
}
