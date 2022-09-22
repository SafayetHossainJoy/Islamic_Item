import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icb/product_model/product.dart';
import 'package:icb/screen/product_detail_screen.dart';
import 'package:icb/widget/brand_colors.dart';
import 'package:icb/widget/open_container_wrapper.dart';

class PopItemList extends StatelessWidget {
  const PopItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size.height);
    return Container(
        height: size.height * 0.35,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.filteredProducts.length,
            itemBuilder: (_, index) {
              Product product = controller.filteredProducts[index];
              return OpenContainerWrapper(
                  child: Card(
                    child: Container(
                      width: size.width * 0.5,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Visibility(
                                visible: controller.isPriceOff(product),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white),
                                  width: 80,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "30% OFF",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.favorite,
                                  color:
                                      controller.filteredProducts[index].isLiked
                                          ? Colors.redAccent
                                          : const Color(0xFFA6A3A0),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(product.images[0],
                                width: size.width * 0.32,
                                height: size.height * 0.16),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: size.width * 0.01),
                            child: Text(
                              product.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                product.off != null
                                    ? product.off.toString()
                                    : product.price.toString(),
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Visibility(
                                visible: product.off != null ? true : false,
                                child: Text(
                                  product.price.toString(),
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  product: product);
            }));
  }
}
