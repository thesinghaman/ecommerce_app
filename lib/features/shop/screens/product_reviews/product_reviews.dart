import 'package:flutter/material.dart';

import '/common/widgets/appbar/appbar.dart';
import '/utils/constants/sizes.dart';
import '/features/shop/controllers/dummy_data.dart';
import 'widgets/progress_indicator_and_rating.dart';
import 'widgets/rating_star.dart';
import 'widgets/review_details_container.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar:
          const AAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Reviews List
              const Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox(height: ASizes.spaceBtwItems),

              /// Overall Product Ratings
              const AOverallProductRating(),
              const ARatingBarIndicator(rating: 3.5),
              const Text("12,611"),
              const SizedBox(height: ASizes.spaceBtwSections),

              /// User Reviews List
              ListView.separated(
                shrinkWrap: true,
                itemCount: ADummyData.productReviews.length,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) =>
                    const SizedBox(height: ASizes.spaceBtwSections),
                itemBuilder: (_, index) => UserReviewCard(
                    productReview: ADummyData.productReviews[index]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
