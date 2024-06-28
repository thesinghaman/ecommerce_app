import 'package:flutter/material.dart';

import '/utils/constants/colors.dart';
import '/features/shop/models/product_attribute_model.dart';
import '/features/shop/models/product_variation_model.dart';

class AttributeWidget extends StatelessWidget {
  final List<ProductVariationModel> variations;
  final ProductAttributeModel attribute;
  final String? selectedValue;
  final Function(String) onValueSelected;

  const AttributeWidget({
    super.key,
    required this.variations,
    required this.attribute,
    required this.selectedValue,
    required this.onValueSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    // Pass the variations to check which attributes are available and stock is not 0
    final availableVariationValues = variations
        .where((variation) =>
            // Check Empty / Out of Stock Attributes
            variation.attributeValues[attribute.name] != null &&
            variation.attributeValues[attribute.name]!.isNotEmpty &&
            variation.stock > 0)
        // Fetch all non-empty attributes of variations
        .map((variation) => variation.attributeValues[attribute.name])
        .toSet();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(attribute.name!),
        const SizedBox(height: 4.0),
        Wrap(
          spacing: 8.0,
          children: attribute.values!.map((value) {
            final isSelected = value == selectedValue;
            final isAvailable = availableVariationValues.contains(value);

            return Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: ChoiceChip(
                label: Text(value),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected && isAvailable) onValueSelected(value);
                },
                selectedColor: AColors.primary,
                labelStyle: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : (isAvailable
                            ? isDark
                                ? AColors.white
                                : AColors.dark
                            : isDark
                                ? Colors.white30
                                : Colors.grey)),
                elevation: isSelected ? 5.0 : 0.0,
                backgroundColor: isSelected
                    ? AColors.primary
                    : (isAvailable
                        ? Colors.transparent
                        : isDark
                            ? AColors.dark
                            : Colors.grey.shade200),
                iconTheme: IconThemeData(
                    color: isSelected ? Colors.white : Colors.black, size: 18),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
