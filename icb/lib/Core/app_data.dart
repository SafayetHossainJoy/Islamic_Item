import 'package:flutter/material.dart';
import 'package:icb/product_model/categorical.dart';
import 'package:icb/product_model/numerical.dart';
import 'package:icb/product_model/product.dart';
import 'package:icb/product_model/product_category.dart';
import 'package:icb/product_model/product_size_type.dart';
import 'package:icb/product_model/recommended_product.dart';

class AppData {
  const AppData._();

  static List<Product> products = [
    Product(
      name: 'Vim Dishwashing Bar ',
      price: 460,
      about:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'images/Vim Dishwashing Bar 125gm.jpg',
      ],
      isLiked: true,
      rating: 1,
    ),
    Product(
      name: 'ACI Pure Salt',
      price: 380,
      about:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      isAvailable: false,
      off: null,
      quantity: 0,
      images: [
        'images/ACI Pure Salt এসিআই লবন ১ কেজি.jpg',
      ],
      isLiked: false,
      rating: 4,
    ),
    Product(
      name: 'Fresh Refined Sugar',
      price: 650,
      about:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'images/Fresh Refined Sugar ফ্রেস পরিশোধিত চিনি ১ কেজি.jpg',
      ],
      isLiked: false,
      rating: 3,
    ),
    Product(
      name: 'Potato-Alu Regular',
      price: 229,
      about:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      isAvailable: true,
      off: 200,
      quantity: 0,
      images: [
        'images/আলু রেগুলার Potato-Alu Regular.jpg',
      ],
      isLiked: false,
      rating: 5,
      sizes: ProductSizeType(categorical: [
        Categorical(CategoricalType.small, true),
        Categorical(CategoricalType.medium, false),
        Categorical(CategoricalType.large, false),
      ]),
    ),
    Product(
      name: 'Onion Indian',
      price: 330,
      about:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'images/পেয়াজ ইন্ডিয়ান লাল Onion Indian ১ কেজি.jpg',
      ],
      isLiked: false,
      rating: 4,
      sizes: ProductSizeType(
          numerical: [Numerical('41', true), Numerical('45', false)]),
    ),
    Product(
      name: 'Roshon Garlic (Imported)',
      price: 230,
      about:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'images/রসুন Roshon Garlic (Imported).jpg',
      ],
      isLiked: false,
      rating: 2,
    ),
    Product(
      name: 'Ginger (Imported)',
      price: 497,
      about:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'images/আদা Ginger (Imported) (৫০০ গ্রাম).jpg',
      ],
      isLiked: false,
      rating: 3,
      sizes: ProductSizeType(numerical: [
        Numerical('43', true),
        Numerical('50', false),
        Numerical('55', false)
      ]),
    ),
    Product(
      name: 'Cardamom 50gm ',
      price: 498,
      about:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'images/এলাচি ৫০ গ্রাম Cardamom 50gm (৫০ গ্রাম).jpg',
      ],
      isLiked: false,
      sizes: ProductSizeType(numerical: [
        Numerical('50', true),
        Numerical('65', false),
        Numerical('85', false)
      ]),
      rating: 2,
    ),
  ];

  static List<ProductCategory> categories = [
    ProductCategory(true, Icons.all_inclusive),
    // ProductCategory(false, FontAwesomeIcons.mobileScreenButton),
    ProductCategory(false, Icons.watch),
    //  ProductCategory(false, FontAwesomeIcons.tablet),
    ProductCategory(false, Icons.headphones),
    ProductCategory(false, Icons.tv),
  ];

  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];

  static List<RecommendedProduct> recommendedProducts = [
    RecommendedProduct(
        imagePath: "", cardBackgroundColor: const Color(0xFFEC6813)),
    RecommendedProduct(
        imagePath: "",
        cardBackgroundColor: const Color(0xFF3081E1),
        buttonBackgroundColor: const Color(0xFF9C46FF),
        buttonTextColor: Colors.white),
  ];
}
