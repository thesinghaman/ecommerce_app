import 'package:flutter/material.dart';

import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';
import '/utils/helpers/helper_functions.dart';
import '/common/widgets/images/a_circular_image.dart';
import '/common/widgets/texts/a_brand_title_text.dart';

/// A widget that displays an image with text below it in a vertical arrangement.
class AVerticalImageAndText extends StatelessWidget {
  /// Constructor for [AVerticalImageAndText].
  const AVerticalImageAndText({
    Key? key,
    this.onTap,
    required this.image,
    required this.title,
    this.backgroundColor,
    this.isNetworkImage = true,
    this.textColor = AColors.white,
  }) : super(key: key);

  /// The image asset path or URL.
  final String image;

  /// The text to be displayed below the image.
  final String title;

  /// The color of the text.
  final Color textColor;

  /// Flag indicating whether the image is loaded from the network.
  final bool isNetworkImage;

  /// The background color of the widget.
  final Color? backgroundColor;

  /// Callback function when the widget is tapped.
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: ASizes.spaceBtwItems),
        child: Column(
          children: [
            ACircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: ASizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: AHelperFunctions.isDarkMode(context)
                  ? AColors.light
                  : AColors.dark,
            ),
            const SizedBox(height: ASizes.spaceBtwItems / 2),
            SizedBox(
                width: 55,
                child: ABrandTitleText(title: title, color: textColor)),
          ],
        ),
      ),
    );
  }
}
