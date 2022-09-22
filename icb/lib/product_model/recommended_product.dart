import 'package:flutter/material.dart';
import 'package:icb/widget/brand_colors.dart';

class RecommendedProduct {
  Color? cardBackgroundColor;
  Color? buttonTextColor;
  Color? buttonBackgroundColor;
  String? imagePath;

  RecommendedProduct(
      {this.cardBackgroundColor,
      this.buttonTextColor = BrandColors.darkOrange,
      this.buttonBackgroundColor = Colors.white,
      this.imagePath});
}
