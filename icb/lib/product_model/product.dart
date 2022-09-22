import 'package:icb/product_model/product_size_type.dart';

class Product {
  String name;
  int price;
  int? off;
  String about;
  bool isAvailable;
  ProductSizeType? sizes;
  int quantity;
  List<String> images;
  bool isLiked;
  double rating;

  Product({
    required this.name,
    required this.price,
    required this.about,
    required this.isAvailable,
    this.sizes,
    required this.off,
    required this.quantity,
    required this.images,
    required this.isLiked,
    required this.rating,
  });
}
